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
import org.apache.giraph.edge.EdgeFactory;
import org.apache.giraph.graph.Vertex;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;

import java.io.IOException;

/**
 * LCC Pregel implementation
 */
@Algorithm(
    name = "LCC"
)
public class MyLCC extends BasicComputation<LongWritable, DoubleWritable, DoubleWritable, LongWritable> {

  static final DoubleWritable original_edge = new DoubleWritable(1);
  static final DoubleWritable extra_edge = new DoubleWritable(2);

  @Override
  public void compute(Vertex<LongWritable, DoubleWritable, DoubleWritable> vertex, Iterable<LongWritable> messages) throws IOException{
    //get current superstep
    long current_superstep = getSuperstep();

    //current_superstep = 0 => inform all your neighbours about your outgoing edge that has them as targets
    if (current_superstep == 0) {
      sendMessageToAllEdges(vertex, vertex.getId());
    }

    //current_superstep = 1 => convert all edges to bidirectional by adding edges wherever needed
    else if (current_superstep == 1){

      //iterate through the incoming edges
      for (LongWritable incoming_vertex_id: messages){
        //get the value of the first edge with the given target vertex id, or null if there is no such edge
        DoubleWritable edge_exists_flag = vertex.getEdgeValue(incoming_vertex_id);

        //if the edge is not bidirectional, then edge_exists_flag will be null
        if (edge_exists_flag == null){
          vertex.addEdge(EdgeFactory.create(incoming_vertex_id, extra_edge));
        }
        else{
          vertex.setEdgeValue(incoming_vertex_id, original_edge);
        }
      }

      for (LongWritable incoming_vertex_id: messages){
        sendMessageToAllEdges(vertex, incoming_vertex_id);
      }
    }

    //current_superstep >= 2 => graph is now undirected
    else {
      long n = vertex.getNumEdges();
      long counter = 0;

      if(n <= 1){
        vertex.setValue(new DoubleWritable(0));
        vertex.voteToHalt();
      }

      else{
        for (LongWritable m: messages){
          if (vertex.getEdgeValue(m) != null) {
            counter += 1;
          }
        }

        double lcc_calculation = (double) counter/(n*(n-1));
        DoubleWritable vertex_lcc = new DoubleWritable(lcc_calculation);
        vertex.setValue(vertex_lcc);

        vertex.voteToHalt();
      }
    }

  }
}
