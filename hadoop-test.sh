#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Create input directory on HDFS
hadoop fs -mkdir -p input

# Put input files to HDFS
hdfs dfs -put $DIR'/data.txt' input

# Run wordcount
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output

# Print output of wordcount
echo "Wordcount Output:"
hdfs dfs -cat output/part-r-00000
