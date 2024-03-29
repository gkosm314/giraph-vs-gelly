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
package org.apache.giraph.io.formats;

import com.google.common.collect.ImmutableList;
import org.apache.giraph.edge.Edge;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.InputSplit;
import org.apache.hadoop.mapreduce.TaskAttemptContext;

import java.io.IOException;

/**
 * Simple text-based {@link org.apache.giraph.io.VertexInputFormat} for
 * unweighted graphs without edges or values, just vertices with ids.
 *
 * Each line is just simply the vertex id.
 */

//Algorithms: BFS,

public class LongLongDoubleTextInputFormat extends TextVertexInputFormat<
    LongWritable, LongWritable, DoubleWritable> {
  @Override
  public TextVertexReader createVertexReader(
      InputSplit split, TaskAttemptContext context) throws IOException {
    return new LongLongDoubleNullVertexReader();
  }

  /**
   * Reader for this InputFormat.
   */
  public class LongLongDoubleNullVertexReader extends
      TextVertexReaderFromEachLineProcessed<String> {
    /** Cached vertex id */
    private LongWritable id;

    @Override
    protected String preprocessLine(Text line) throws IOException {
      id = new LongWritable(Long.parseLong(line.toString()));
      return line.toString();
    }

    @Override
    protected LongWritable getId(String line) throws IOException {
      return id;
    }

    @Override
    protected LongWritable getValue(String line) throws IOException {
      return new LongWritable(0);
    }

    @Override
    protected Iterable<Edge<LongWritable, DoubleWritable>> getEdges(String line)
      throws IOException {
      return ImmutableList.of();
    }
  }
}
