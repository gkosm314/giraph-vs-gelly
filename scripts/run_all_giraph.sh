echo 'small_indegree_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyInDegree -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_indegree_1_results) 2> /home/user/measurements/giraph_measurements/small_indegree_1
echo 'small_indegree_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_indegree_1_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyInDegree -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_indegree_1_with_combiner_results -c org.apache.giraph.combiner.MyLongSumMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_indegree_1_with_combiner
echo 'small_indegree_1_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_indegree_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyInDegree -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_indegree_2_results) 2> /home/user/measurements/giraph_measurements/small_indegree_2
echo 'small_indegree_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_indegree_2_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyInDegree -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_indegree_2_with_combiner_results -c org.apache.giraph.combiner.MyLongSumMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_indegree_2_with_combiner
echo 'small_indegree_2_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_indegree_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyInDegree -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_indegree_3_results) 2> /home/user/measurements/giraph_measurements/small_indegree_3
echo 'small_indegree_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_indegree_3_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyInDegree -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_indegree_3_with_combiner_results -c org.apache.giraph.combiner.MyLongSumMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_indegree_3_with_combiner
echo 'small_indegree_3_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_outdegree_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyOutDegree -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_outdegree_1_results) 2> /home/user/measurements/giraph_measurements/small_outdegree_1
echo 'small_outdegree_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_outdegree_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyOutDegree -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_outdegree_2_results) 2> /home/user/measurements/giraph_measurements/small_outdegree_2
echo 'small_outdegree_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_outdegree_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyOutDegree -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_outdegree_3_results) 2> /home/user/measurements/giraph_measurements/small_outdegree_3
echo 'small_outdegree_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_bfs_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyBFS -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_bfs_1_results) 2> /home/user/measurements/giraph_measurements/small_bfs_1
echo 'small_bfs_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_bfs_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyBFS -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_bfs_2_results) 2> /home/user/measurements/giraph_measurements/small_bfs_2
echo 'small_bfs_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_bfs_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyBFS -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_bfs_3_results) 2> /home/user/measurements/giraph_measurements/small_bfs_3
echo 'small_bfs_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_sssp_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MySSSP -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_sssp_1_results) 2> /home/user/measurements/giraph_measurements/small_sssp_1
echo 'small_sssp_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_sssp_1_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MySSSP -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_sssp_1_with_combiner_results -c org.apache.giraph.combiner.MinimumLongDoubleMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_sssp_1_with_combiner
echo 'small_sssp_1_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_sssp_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MySSSP -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_sssp_2_results) 2> /home/user/measurements/giraph_measurements/small_sssp_2
echo 'small_sssp_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_sssp_2_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MySSSP -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_sssp_2_with_combiner_results -c org.apache.giraph.combiner.MinimumLongDoubleMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_sssp_2_with_combiner
echo 'small_sssp_2_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_sssp_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MySSSP -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_sssp_3_results) 2> /home/user/measurements/giraph_measurements/small_sssp_3
echo 'small_sssp_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_sssp_3_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MySSSP -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_sssp_3_with_combiner_results -c org.apache.giraph.combiner.MinimumLongDoubleMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_sssp_3_with_combiner
echo 'small_sssp_3_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_pagerank_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyPagerank -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_pagerank_1_results) 2> /home/user/measurements/giraph_measurements/small_pagerank_1
echo 'small_pagerank_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_pagerank_1_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyPagerank -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_pagerank_1_with_combiner_results -c org.apache.giraph.combiner.MyDoubleSumMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_pagerank_1_with_combiner
echo 'small_pagerank_1_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_pagerank_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyPagerank -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_pagerank_2_results) 2> /home/user/measurements/giraph_measurements/small_pagerank_2
echo 'small_pagerank_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_pagerank_2_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyPagerank -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_pagerank_2_with_combiner_results -c org.apache.giraph.combiner.MyDoubleSumMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_pagerank_2_with_combiner
echo 'small_pagerank_2_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_pagerank_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyPagerank -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_pagerank_3_results) 2> /home/user/measurements/giraph_measurements/small_pagerank_3
echo 'small_pagerank_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_pagerank_3_with_combiner began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyPagerank -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_pagerank_3_with_combiner_results -c org.apache.giraph.combiner.MyDoubleSumMessageCombiner) 2> /home/user/measurements/giraph_measurements/small_pagerank_3_with_combiner
echo 'small_pagerank_3_with_combiner ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_wcc_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyWCC -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_wcc_1_results) 2> /home/user/measurements/giraph_measurements/small_wcc_1
echo 'small_wcc_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_wcc_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyWCC -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_wcc_2_results) 2> /home/user/measurements/giraph_measurements/small_wcc_2
echo 'small_wcc_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_wcc_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyWCC -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_wcc_3_results) 2> /home/user/measurements/giraph_measurements/small_wcc_3
echo 'small_wcc_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_communitydetection_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyCommunityDetection -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_communitydetection_1_results) 2> /home/user/measurements/giraph_measurements/small_communitydetection_1
echo 'small_communitydetection_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_communitydetection_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyCommunityDetection -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_communitydetection_2_results) 2> /home/user/measurements/giraph_measurements/small_communitydetection_2
echo 'small_communitydetection_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_communitydetection_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyCommunityDetection -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongLongDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_communitydetection_3_results) 2> /home/user/measurements/giraph_measurements/small_communitydetection_3
echo 'small_communitydetection_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_lcc_1 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyLCC -w 1 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_lcc_1_results) 2> /home/user/measurements/giraph_measurements/small_lcc_1
echo 'small_lcc_1 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_lcc_2 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyLCC -w 2 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_lcc_2_results) 2> /home/user/measurements/giraph_measurements/small_lcc_2
echo 'small_lcc_2 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

echo 'small_lcc_3 began' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs
(time giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.MyLCC -w 3 -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.LongDoubleDoubleTextInputFormat -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip hdfs://master:9000/user/datasets/small.e -vip hdfs://master:9000/user/datasets/small.v -op hdfs://master:9000/user/outputs/small_lcc_3_results) 2> /home/user/measurements/giraph_measurements/small_lcc_3
echo 'small_lcc_3 ended' >> /home/user/measurements/giraph_measurements/giraph_measurement_logs

