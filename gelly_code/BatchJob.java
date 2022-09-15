/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package gellyalgos;

import java.io.*;
import java.util.*;

import org.apache.flink.api.java.ExecutionEnvironment;
import org.apache.flink.api.java.DataSet;
import org.apache.flink.api.java.tuple.*;
import org.apache.flink.core.fs.FileSystem.WriteMode;
import org.apache.flink.types.LongValue;
import org.apache.flink.types.NullValue;
import org.apache.flink.graph.*;
import org.apache.flink.graph.library.*;
import org.apache.flink.graph.library.linkanalysis.*;
import org.apache.flink.graph.library.clustering.directed.LocalClusteringCoefficient;
import org.apache.flink.graph.asm.degree.annotate.directed.*;
import gellyalgos.VertexValueMap;
import gellyalgos.LCCScoreMap;

public class BatchJob {

	private static final WriteMode write_mode = WriteMode.NO_OVERWRITE; //change to OVERWRITE if you want to allow overwritting output files

	private static void output_dataset(DataSet<?> dataset_arg, String output_path_arg) throws Exception {
		dataset_arg.writeAsText(output_path_arg,write_mode);
	}

	public static void main(String[] args) throws Exception {

		//args: input_path,output_path,algorithm_name
		String input_path;	//input path should be given without the .v or .e suffix
		String output_path;
		String algorithm_name;

		//Parse input arguments
		if(args.length < 3){
			System.out.println("Gelly Program - Error: Command-line arguments missing");
			return;
		}
		else{
			input_path = args[0];	//input path should be given without the .v or .e suffix
			output_path = args[1];
			algorithm_name = args[2];
		}

		//set up the batch execution environment
		final ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

		//define paths to input csv files by appending the appropriate suffix
		final String vertex_input_path = input_path + ".v";
		final String edge_input_path = input_path + ".e";

		//read enviroment variables for algorithms-specific parameters
		final long source_vertex_sssp = Long.parseLong(System.getenv("DATASET_PARAM_SSSP_SOURCE_VERTEX_ID"));
		final double dumping_factor_pr = Double.parseDouble(System.getenv("DATASET_PARAM_PR_DAMPING_FACTOR"));
		final int max_iterations_pr = Integer.parseInt(System.getenv("DATASET_PARAM_PR_NUM_ITERATIONS"));
		final int max_iterations_cdlp = Integer.parseInt(System.getenv("DATASET_PARAM_CDLP_MAX_ITERATIONS"));

		//construct csv reader
		//constructor types: GraphCsvReader(String vertexPath, String edgePath, ExecutionEnvironment context)
		GraphCsvReader input_reader = new GraphCsvReader(vertex_input_path,edge_input_path,env);

		//change field delimiter to space character
		input_reader.fieldDelimiterEdges(" ");
		input_reader.fieldDelimiterVertices(" ");

		//For each algorithm we follow these steps:
		//1. read the graph from the input and apply transformations if they are necessary
		//2. construct the Graph object
		//3. run the appropriate algorithm and save the results in a DataSet
		//4. output data
		//TODO: rewrite this part of the code using generics to avoid code repetition
		if(algorithm_name.equals("MyInDegree")){
			Graph<Long, NullValue, Double> graph = input_reader.edgeTypes(Long.class, Double.class);
			DataSet<Vertex<Long, LongValue>> result_dataset = graph.run(new VertexInDegree<Long,NullValue,Double>().setIncludeZeroDegreeVertices(true));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MyOutDegree")){
			Graph<Long, NullValue, Double> graph = input_reader.edgeTypes(Long.class, Double.class);
			DataSet<Vertex<Long, LongValue>> result_dataset = graph.run(new VertexOutDegree<Long,NullValue,Double>().setIncludeZeroDegreeVertices(true));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MySSSP")){
			Graph<Long, NullValue, Double> graph = input_reader.edgeTypes(Long.class, Double.class);
			DataSet<Vertex<Long, Double>> result_dataset = graph.run(new SingleSourceShortestPaths<Long,NullValue>(source_vertex_sssp,Integer.MAX_VALUE));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MySSSP_GSA")){
			Graph<Long, NullValue, Double> graph = input_reader.edgeTypes(Long.class, Double.class);
			DataSet<Vertex<Long, Double>> result_dataset = graph.run(new GSASingleSourceShortestPaths<Long,NullValue>(source_vertex_sssp,Integer.MAX_VALUE));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MyPagerank")){
			Graph<Long, NullValue, Double> graph = input_reader.edgeTypes(Long.class, Double.class);
			DataSet<PageRank.Result<Long>> result_dataset = graph.run(new PageRank<Long,NullValue,Double>(dumping_factor_pr,max_iterations_pr));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MyWCC")){
			//read vertex ids from csv
			DataSet<Tuple1<Long>> vertex_ids_dataset = env.readCsvFile(vertex_input_path).fieldDelimiter(" ").types(Long.class);
			//map: (vertex id) -> (vertex id,vertex id)
			DataSet<Tuple2<Long, Long>> vertex_input_tuples = vertex_ids_dataset.map(new VertexValueMap<Long>());
			//read edges from csv
			DataSet<Tuple3<Long, Long, Double>> edge_input_tuples = env.readCsvFile(edge_input_path).fieldDelimiter(" ").types(Long.class, Long.class, Double.class);
			//construct graph
			Graph<Long, Long, Double> graph = Graph.fromTupleDataSet(vertex_input_tuples, edge_input_tuples, env);
			DataSet<Vertex<Long, Long>> result_dataset = graph.run(new ConnectedComponents<Long,Long,Double>(Integer.MAX_VALUE));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MyWCC_GSA")){
			//read vertex ids from csv
			DataSet<Tuple1<Long>> vertex_ids_dataset = env.readCsvFile(vertex_input_path).fieldDelimiter(" ").types(Long.class);
			//map: (vertex id) -> (vertex id,vertex id)
			DataSet<Tuple2<Long, Long>> vertex_input_tuples = vertex_ids_dataset.map(new VertexValueMap<Long>());
			//read edges from csv
			DataSet<Tuple3<Long, Long, Double>> edge_input_tuples = env.readCsvFile(edge_input_path).fieldDelimiter(" ").types(Long.class, Long.class, Double.class);
			//construct graph
			Graph<Long, Long, Double> graph = Graph.fromTupleDataSet(vertex_input_tuples, edge_input_tuples, env);
			DataSet<Vertex<Long, Long>> result_dataset = graph.run(new GSAConnectedComponents<Long,Long,Double>(Integer.MAX_VALUE));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MyCommunityDetection")){
			//read vertex ids from csv
			DataSet<Tuple1<Long>> vertex_ids_dataset = env.readCsvFile(vertex_input_path).fieldDelimiter(" ").types(Long.class);
			//map: (vertex id) -> (vertex id,vertex id)
			DataSet<Tuple2<Long, Long>> vertex_input_tuples = vertex_ids_dataset.map(new VertexValueMap<Long>());
			//read edges from csv
			DataSet<Tuple3<Long, Long, Double>> edge_input_tuples = env.readCsvFile(edge_input_path).fieldDelimiter(" ").types(Long.class, Long.class, Double.class);
			//construct graph
			Graph<Long, Long, Double> graph = Graph.fromTupleDataSet(vertex_input_tuples, edge_input_tuples, env);
			DataSet<Vertex<Long, Long>> result_dataset = graph.run(new LabelPropagation<Long,Long,Double>(max_iterations_cdlp));
			output_dataset(result_dataset,output_path);
		}

		else if(algorithm_name.equals("MyLCC")){
			Graph<LongValue, NullValue, Double> graph = input_reader.edgeTypes(LongValue.class, Double.class);
			DataSet<LocalClusteringCoefficient.Result<LongValue>> lcc_result_dataset = graph.run(new LocalClusteringCoefficient<LongValue,NullValue,Double>().setIncludeZeroDegreeVertices(true));
			DataSet<Tuple2<LongValue,Double>> result_dataset = lcc_result_dataset.map(new LCCScoreMap());
			output_dataset(result_dataset,output_path);
		}

		else{
			throw new IllegalArgumentException("Algorithm " + algorithm_name + " not supported!");
		}

		//execute
		env.execute();
	}
}
