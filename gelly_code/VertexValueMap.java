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

import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.api.java.tuple.*;

public class VertexValueMap<T> implements MapFunction<Tuple1<T>,Tuple2<T,T>>{
  //T: vertex id type, U: vertex label type
  //get an id of type T and return a tuple of type (T,U)

  @Override
  public Tuple2<T,T> map(Tuple1<T> vertex_id){
    return new Tuple2(vertex_id.f0,vertex_id.f0);
  }

}
