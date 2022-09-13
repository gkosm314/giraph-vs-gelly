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

/**
 * SSSP Pregel implementation
 */
@Algorithm(
    name = "SSSP"
)
public class MySSSP extends BasicComputation<LongWritable, DoubleWritable, DoubleWritable, DoubleWritable> {

  //Depth of unvisited node = +infinity
  private static final double MAX_DISTANCE = Double.MAX_VALUE;

  //Read the source vertex from the respective enviroment variable
  private static final long source_vertex_id = Long.parseLong(System.getenv("DATASET_PARAM_SSSP_SOURCE_VERTEX_ID"));

  //send messages to all your neighboors. message = my value + edge value
  private void update_distances(Vertex<LongWritable, DoubleWritable, DoubleWritable> vertex){

    DoubleWritable message_to_sent = new DoubleWritable();

    //iterate through the edges
    for(Edge<LongWritable, DoubleWritable> outgoing_edge: vertex.getEdges()){
      message_to_sent.set(vertex.getValue().get() + outgoing_edge.getValue().get());
      sendMessage(outgoing_edge.getTargetVertexId(),message_to_sent);
    }
  }

  @Override
  public void compute(Vertex<LongWritable, DoubleWritable, DoubleWritable> vertex, Iterable<DoubleWritable> messages) throws IOException{
    //get current superstep
    long current_superstep = getSuperstep();

    if (current_superstep == 0) {
      //current_superstep = 0 => initialize depths
      if (vertex.getId().get() == source_vertex_id) {
        //if you are the source vertex your depth is 0
        vertex.getValue().set(0);
        //send message to your neighboorhood to begin the traversal
        update_distances(vertex);
      }
      else {
        //if you are not the source vertex your intialial distance is +Infinite
        vertex.getValue().set(MAX_DISTANCE);
      }
    }
    else {
      //initialize minimum received distance
      double min_received_distance = MAX_DISTANCE;

      //min_received_distance = minimum updated distance sent to us by neighboors => best candidate to replace current minimum distance
      for(DoubleWritable message: messages){
        min_received_distance = Math.min(min_received_distance, message.get());
      }

      //if the best updated distance is better than our current distance, replace our distance and inform our neighboors
      if (min_received_distance < vertex.getValue().get()) {
        vertex.getValue().set(min_received_distance);
        update_distances(vertex);
      }
    }

    //you did your job, you can rest until the traversal reaches you again
    vertex.voteToHalt();
  }
}
