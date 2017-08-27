#!/bin/bash

hadoop fs -ls /hduser/aviation/airline_ontime | awk '{print $8}' | \
while read f
do
  hadoop fs -cat $f | head -n 1
done
