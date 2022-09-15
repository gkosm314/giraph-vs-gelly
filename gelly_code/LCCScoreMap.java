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

import java.lang.Double.*;
import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.types.LongValue;
import org.apache.flink.graph.library.clustering.directed.LocalClusteringCoefficient;

public class LCCScoreMap implements MapFunction<LocalClusteringCoefficient.Result<LongValue>,Tuple2<LongValue,Double>>{

  @Override
  public Tuple2<LongValue,Double> map(LocalClusteringCoefficient.Result<LongValue> r){
    //get LCC score
    double lcc_score = r.getLocalClusteringCoefficientScore();

    //NaN is returned for a vertex with degree <= 1, so we convert NaN to 0 according to the LDBC Graphalytics specifications
    if(Double.isNaN(lcc_score)){
      lcc_score = 0.0;
    }
    
    //return tuple (vertex_id,lcc_score)
    return new Tuple2(r.getVertexId0(),lcc_score);
  }
}
