echo 'small_indegree_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_indegree_1_results MyInDegree) 2> /home/user/measurements/gelly_measurements/small_indegree_1
echo 'small_indegree_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_outdegree_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_outdegree_1_results MyOutDegree) 2> /home/user/measurements/gelly_measurements/small_outdegree_1
echo 'small_outdegree_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_sssp_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_sssp_1_results MySSSP) 2> /home/user/measurements/gelly_measurements/small_sssp_1
echo 'small_sssp_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_sssp_gsa_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_sssp_gsa_1_results MySSSP_GSA) 2> /home/user/measurements/gelly_measurements/small_sssp_gsa_1
echo 'small_sssp_gsa_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_pagerank_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_pagerank_1_results MyPagerank) 2> /home/user/measurements/gelly_measurements/small_pagerank_1
echo 'small_pagerank_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_wcc_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_wcc_1_results MyWCC) 2> /home/user/measurements/gelly_measurements/small_wcc_1
echo 'small_wcc_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_wcc_gsa_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_wcc_gsa_1_results MyWCC_GSA) 2> /home/user/measurements/gelly_measurements/small_wcc_gsa_1
echo 'small_wcc_gsa_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_communitydetection_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_communitydetection_1_results MyCommunityDetection) 2> /home/user/measurements/gelly_measurements/small_communitydetection_1
echo 'small_communitydetection_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_lcc_1 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 1 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_lcc_1_results MyLCC) 2> /home/user/measurements/gelly_measurements/small_lcc_1
echo 'small_lcc_1 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_indegree_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_indegree_2_results MyInDegree) 2> /home/user/measurements/gelly_measurements/small_indegree_2
echo 'small_indegree_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_outdegree_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_outdegree_2_results MyOutDegree) 2> /home/user/measurements/gelly_measurements/small_outdegree_2
echo 'small_outdegree_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_sssp_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_sssp_2_results MySSSP) 2> /home/user/measurements/gelly_measurements/small_sssp_2
echo 'small_sssp_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_sssp_gsa_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_sssp_gsa_2_results MySSSP_GSA) 2> /home/user/measurements/gelly_measurements/small_sssp_gsa_2
echo 'small_sssp_gsa_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_pagerank_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_pagerank_2_results MyPagerank) 2> /home/user/measurements/gelly_measurements/small_pagerank_2
echo 'small_pagerank_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_wcc_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_wcc_2_results MyWCC) 2> /home/user/measurements/gelly_measurements/small_wcc_2
echo 'small_wcc_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_wcc_gsa_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_wcc_gsa_2_results MyWCC_GSA) 2> /home/user/measurements/gelly_measurements/small_wcc_gsa_2
echo 'small_wcc_gsa_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_communitydetection_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_communitydetection_2_results MyCommunityDetection) 2> /home/user/measurements/gelly_measurements/small_communitydetection_2
echo 'small_communitydetection_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_lcc_2 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 2 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_lcc_2_results MyLCC) 2> /home/user/measurements/gelly_measurements/small_lcc_2
echo 'small_lcc_2 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_indegree_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_indegree_3_results MyInDegree) 2> /home/user/measurements/gelly_measurements/small_indegree_3
echo 'small_indegree_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_outdegree_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_outdegree_3_results MyOutDegree) 2> /home/user/measurements/gelly_measurements/small_outdegree_3
echo 'small_outdegree_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_sssp_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_sssp_3_results MySSSP) 2> /home/user/measurements/gelly_measurements/small_sssp_3
echo 'small_sssp_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_sssp_gsa_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_sssp_gsa_3_results MySSSP_GSA) 2> /home/user/measurements/gelly_measurements/small_sssp_gsa_3
echo 'small_sssp_gsa_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_pagerank_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_pagerank_3_results MyPagerank) 2> /home/user/measurements/gelly_measurements/small_pagerank_3
echo 'small_pagerank_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_wcc_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_wcc_3_results MyWCC) 2> /home/user/measurements/gelly_measurements/small_wcc_3
echo 'small_wcc_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_wcc_gsa_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_wcc_gsa_3_results MyWCC_GSA) 2> /home/user/measurements/gelly_measurements/small_wcc_gsa_3
echo 'small_wcc_gsa_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_communitydetection_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_communitydetection_3_results MyCommunityDetection) 2> /home/user/measurements/gelly_measurements/small_communitydetection_3
echo 'small_communitydetection_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

echo 'small_lcc_3 began' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs
(time ./flink-1.14.4/bin/flink run -p 3 gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/small_lcc_3_results MyLCC) 2> /home/user/measurements/gelly_measurements/small_lcc_3
echo 'small_lcc_3 ended' >> /home/user/measurements/gelly_measurements/gelly_measurement_logs

