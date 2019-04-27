#!/bin/bash

# Create input directory on HDFS
hadoop fs -mkdir -p input

# Put input files to HDFS
hdfs dfs -put ./input/* input

# Run wordcount
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output

# Print output of wordcount
echo "Wordcount Output:"
hdfs dfs -cat output/part-r-00000
