# bigdata-giraph-vs-gelly
This is a semester project for the course _Analysis and Design of Information Systems_ at the National Technical University of Athens (NTUA).

The primary goal of this project was to compare the performance of [Apache Giraph](https://giraph.apache.org) and [Apache Flink(Gelly)](https://nightlies.apache.org/flink/flink-docs-release-1.15/docs/libs/gelly/overview/), which are two open-source distributed graph processing frameworks. The methodology was inspired by the approach described in the [LDBC Graphalytics](https://graphalytics.org/) benchmark.

* The report that extensively describes the project and its results: **report.pdf**
* The slides that were used for the project presentation: **slides.pdf**

## Preface

* For Giraph, I developed my own implementations for all the algorithms, the combiners and the input parsing
* For Gelly, I used the built-in algorithms
* For the cluster, VMs from [okeanos-knossos](https://okeanos-knossos.grnet.gr/home/) were used
* For the distributed file system, HDFS was used

## Methodology

In order to decide which algorithms should be chosen for this project, previous related work as well as several surveys were taken into account. After careful examination of the bibliography, I reached the conclusion that the [LDBC Graphalytics](https://graphalytics.org/) benchmark was the most suitable, so I used it as a prototype for the structure of this project.

## Algorithms

The following algorithms were selected as the basis of the comparsion between the two systems, so that they cover a broad and representative range of possible kinds of graph processing:
* In-Degree
* Out-Degree
* Single-Source Shortest Path (SSSP)
* PageRank
* Weakly Connected Components (WCC)
* Community Detection with Label Propagation (CDLP)
* Local Clustering Coefficient (LCC)

## Setup

Instructions to setup the system from scratch can be found in the report.

## Learning Outcomes

* learned how to implement graph algorithms using the vertex-centring approach
* gained experience in deploying graph algorithms in a distributed environment
* got familiar with the distributed graph processing ecosystem
