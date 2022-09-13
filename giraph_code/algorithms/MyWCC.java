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
 * WCC Pregel implementation
 */
@Algorithm(
    name = "WCC"
)
public class MyWCC extends BasicComputation<LongWritable, LongWritable, DoubleWritable, LongWritable> {

  static final DoubleWritable zero_edge_weight_value = new DoubleWritable(0);

  @Override
  public void compute(Vertex<LongWritable, LongWritable, DoubleWritable> vertex, Iterable<LongWritable> messages) throws IOException{
    //get current superstep
    long current_superstep = getSuperstep();

    //current_superstep = 0 => inform all your neighbours about your outgoing edge that has them as targets
    if (current_superstep == 0) {
      sendMessageToAllEdges(vertex, vertex.getId());
    }

    //current_superstep = 10 => convert all edges to bidirectional by adding edges wherever needed
    else if (current_superstep == 1){

      //iterate through the incoming edges
      for (LongWritable incoming_vertex_id: messages){
        //get the value of the first edge with the given target vertex id, or null if there is no such edge
        DoubleWritable edge_exists_flag = vertex.getEdgeValue(incoming_vertex_id);

        //if the edge is not bidirectional, then edge_exists_flag will be null
        if (edge_exists_flag == null){
          vertex.addEdge(EdgeFactory.create(incoming_vertex_id, zero_edge_weight_value));
        }
        else{
          vertex.setEdgeValue(incoming_vertex_id, zero_edge_weight_value); //for uniformity
        }
      }

      //Find neighbor with lower id
      long minimum_neighbor_id = vertex.getValue().get();
      for (Edge<LongWritable, DoubleWritable> e : vertex.getEdges()) {
        long candidate_neighbor_id = e.getTargetVertexId().get();
        if (candidate_neighbor_id < minimum_neighbor_id) {
          minimum_neighbor_id = candidate_neighbor_id;
        }
      }

      //Initialize your "component id" as min(your id, lowest neighbor id)
      vertex.getValue().set(minimum_neighbor_id);
      sendMessageToAllEdges(vertex, new LongWritable(minimum_neighbor_id));

      //you did your job, you can rest until the traversal reaches you again
      vertex.voteToHalt();
    }

    //current_superstep >= 2 => graph is now undirected, we can work on finding weakly connected components
    else {
      // the minimum component id you received
      long minimum_received_id = vertex.getValue().get();

      for (LongWritable message : messages) {
        long message_value = message.get();
        if(message_value < minimum_received_id){
          minimum_received_id = message_value;
        }
      }

      // if you got informed about a component with lower id than yours, change your "component" id and inform all your neighbours, in order for them to change too
      if (minimum_received_id < vertex.getValue().get()){
        vertex.setValue(new LongWritable(minimum_received_id));
        sendMessageToAllEdges(vertex, vertex.getValue());
      }

      //you did your job, you can rest until the traversal reaches you again
      vertex.voteToHalt();

    }
  }
}
