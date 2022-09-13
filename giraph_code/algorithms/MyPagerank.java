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

package org.apache.giraph.examples;

import org.apache.giraph.graph.BasicComputation;
import org.apache.giraph.edge.Edge;
import org.apache.giraph.graph.Vertex;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;

import java.io.IOException;

/*
 * PageRank Pregel implementation
*/
@Algorithm(
    name = "PageRank"
)
public class MyPagerank extends BasicComputation<LongWritable, DoubleWritable, DoubleWritable, DoubleWritable> {

 //pagerank dumping factor d
 private static final double d = 0.85;

 //maximum # of iterations until stop
 //private static final long max_iterations = 2;
 private static final long max_iterations = Long.parseLong(System.getenv("DATASET_PARAM_PR_NUM_ITERATIONS"));

 @Override
 public void compute(Vertex<LongWritable, DoubleWritable, DoubleWritable> vertex, Iterable<DoubleWritable> messages) throws IOException {
   //get current superstep
   long current_superstep = getSuperstep();

   //total number of vertices
   double N = (double)getTotalNumVertices();

   //variable for the pagerank of this vertice
   double updated_vertex_pagerank;

   if (current_superstep == 0) {
     //if this is the first superstep, initialize PRs for every vertex
     updated_vertex_pagerank = 1/N;
   }
   else {
     //if this is not the first superstep, calculate the PR of each vertex based on the received relative PRs

     //calculate sum of the received PRs (second component)
     double sum_of_relative_pageranks = 0;
     for(DoubleWritable message: messages){
       //Use MyDoubleSumMessageCombiner
       sum_of_relative_pageranks += message.get();
     }

     //calculate the PR of this vertex and change the PR of the vertex accordingly
     updated_vertex_pagerank = (1-d)/N + d*sum_of_relative_pageranks;
   }

   //set the new PR value of the vertex
   vertex.getValue().set(updated_vertex_pagerank);

   //if we reached the maximum number of iterations stop, otherwise send your new relative PR to your neighbours
   if (current_superstep < max_iterations) {
     DoubleWritable updated_vertex_relative_pagerank = new DoubleWritable(vertex.getValue().get()/vertex.getNumEdges());
     sendMessageToAllEdges(vertex, updated_vertex_relative_pagerank);
   }
   else{
     vertex.voteToHalt();
   }
 }
}
