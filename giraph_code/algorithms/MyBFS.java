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
 * BFS Pregel implementation
 */
@Algorithm(
    name = "BFS"
)
public class MyBFS extends BasicComputation<LongWritable, LongWritable, DoubleWritable, LongWritable> {

  //Depth of unvisited node = +infinity
  private static final long UNVISITED = Long.MAX_VALUE;

  private static final long source_vertex_id = Long.parseLong(System.getenv("DATASET_PARAM_BFS_SOURCE_VERTEX_ID"));

  @Override
  public void compute(Vertex<LongWritable, LongWritable, DoubleWritable> vertex, Iterable<LongWritable> messages) throws IOException{
    //get current superstep
    long current_superstep = getSuperstep();

    if (current_superstep == 0) {
      //current_superstep = 0 => initialize depths
      if (vertex.getId().get() == source_vertex_id) {
        //if you are the source vertex your depth is 0
        vertex.getValue().set(0);
        //send message to your neighboorhood to begin the traversal
        sendMessageToAllEdges(vertex, vertex.getValue());
      }
      else {
        //if you are not the source vertex your intialial depth is not yet defined
        vertex.getValue().set(UNVISITED);
      }
    }
    else {
      //if current_superstep is not the first, then if the traversal reaches you it took #current_superstep hops for the dfs to get to you
      if(vertex.getValue().get() == UNVISITED){
        vertex.getValue().set(current_superstep);
        sendMessageToAllEdges(vertex, vertex.getValue());
      }
    }

    //you did your job, you can rest until the traversal reaches you again
    vertex.voteToHalt();
  }
}
