#!/bin/bash

hadoop jar /usr/hdp/2.6.0.3-8/hadoop-mapreduce/hadoop-streaming.jar \
-mapper mapper.py \
-reducer reducer.py \
-input /hduser/aviation/airline_ontime/*.csv \
-output popular_airport2 \
-file mapper.py \
-file reducer.py
