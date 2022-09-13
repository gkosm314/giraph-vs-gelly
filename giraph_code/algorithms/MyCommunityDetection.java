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
import java.util.*;


/**
 * CDLP Pregel implementation
 */
@Algorithm(
    name = "CDLP"
)
public class MyCommunityDetection extends BasicComputation<LongWritable, LongWritable, DoubleWritable, LongWritable> {

  //maximum # of iterations until stop
  private static final long max_iterations = Long.parseLong(System.getenv("DATASET_PARAM_CDLP_MAX_ITERATIONS"));

  static final DoubleWritable unidirectional_edge_value = new DoubleWritable(1);
  static final DoubleWritable bidirectional_edge_value = new DoubleWritable(2);

  //propagates your label to your neighbours according to the edge (once if unidirectional, twice if bidirectional)
  private void propagate_label(Vertex<LongWritable, LongWritable, DoubleWritable> vertex){

    //Get your label
    LongWritable mylabel = vertex.getValue();

    //Iterate through your outgoing edges
    for (Edge<LongWritable, DoubleWritable> e : vertex.getEdges()) {
      if(e.getValue().get() == 2){
        //if the edge is bidirectional, send label twice
        sendMessage(e.getTargetVertexId(), mylabel);
        sendMessage(e.getTargetVertexId(), mylabel);
      }
      else{
        //if the edge is unidirectional, send label once
        sendMessage(e.getTargetVertexId(), mylabel);
      }
    }
  }

  @Override
  public void compute(Vertex<LongWritable, LongWritable, DoubleWritable> vertex, Iterable<LongWritable> messages) throws IOException{

    //get current superstep
    long current_superstep = getSuperstep();

    //current_superstep = 0 => inform all your neighbours about your outgoing edge that has them as targets
    if (current_superstep == 0) {
      sendMessageToAllEdges(vertex, vertex.getId());
    }

    //current_superstep = 1 => convert graph to undirectional by adding edges wherever needed
    else if(current_superstep == 1){

      //iterate through the incoming edges and add their source vertices to a set
      Set<Long> incoming_ids_set = new HashSet<Long>();
      for (LongWritable incoming_vertex_id: messages){
        incoming_ids_set.add(incoming_vertex_id.get());
      }

      //iterate through outgoing edges of this vertex
      for (Edge<LongWritable, DoubleWritable> e : vertex.getMutableEdges()) {
        //target of outgoing edge e
        LongWritable target_vertex = e.getTargetVertexId();

        //if an incoming edge exists too, then the edge is bidirectional => characterize it as such
        if(incoming_ids_set.contains(target_vertex.get())) {
          e.getValue().set(bidirectional_edge_value.get());
          incoming_ids_set.remove(target_vertex.get()); //remove target vertex from the "unmatched" incoming edges
        }
        //otherwise, it is unidirectional
        else {
          e.getValue().set(unidirectional_edge_value.get());
        }
      }

      //iterate through "unmatched" incoming edges and match them with new edges (unidirectional)
      for(long v: incoming_ids_set){
        vertex.addEdge(EdgeFactory.create(new LongWritable(v), unidirectional_edge_value));
      }

      // Set the initial label of the vertex
      vertex.setValue(vertex.getId());
      //Send label to neighbours
      propagate_label(vertex);
    }

    //current_superstep >= 2 => execute label propagation iteration
    else {

      //label-to-frequency map
      Map<Long,Long> labelFrequency = new HashMap<Long,Long>();

      //Construct the label-to-frequency map
      //iterate through the incoming labels
      for (LongWritable currentLabel : messages){
        // get the value of the label
        long currentLabelValue = currentLabel.get();

        // find out how many times you have seen this label until now
        long currentLabelFrequency = labelFrequency.getOrDefault(currentLabelValue,0L);

        //increase the times you have seen this label by 1
        labelFrequency.put(currentLabelValue, currentLabelFrequency + 1);
      }

      //Find the new label for this vertex
      Map.Entry<Long,Long> newLabel = null;

      //iterate through the label-to-frequency map
      for (Map.Entry<Long,Long> currentEntry : labelFrequency.entrySet()) {
        //change the best pair found so far if the new pair has more occurences or if it has equal occurences but smaller label key
        if (newLabel == null || newLabel.getValue().compareTo(currentEntry.getValue()) < 0 || (newLabel.getValue().equals(currentEntry.getValue()) && newLabel.getKey().compareTo(currentEntry.getKey()) > 0)) {
          newLabel = currentEntry;
        }
      }

      // Update the label of this vertex
      if(newLabel != null){
        vertex.setValue(new LongWritable(newLabel.getKey()));
      }

      //if we have not reached max_iterations, continue propagating your label, otherwise stop
      if (current_superstep >= max_iterations + 1){
        //max_iterations + 1 = max_iterations + 2 - 1
        vertex.voteToHalt();
      }
      else{
        propagate_label(vertex);
      }
    }

  }
}
