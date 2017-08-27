#!/usr/bin/python

import sys
import csv

def reducer():
    flightsTotal = 0
    oldKey = None
    for line in sys.stdin:
        data = line.strip().split("\t")
        if len(data)!=2:
	    continue
	thisKey, thisFlights = data
	if oldKey and oldKey != thisKey:
	    # In this case first emit old result
            print "{0}\t{1}".format(oldKey,flightsTotal)
	    # now reset the accumulated result
	    flightsTotal = 0
	oldKey = thisKey
	flightsTotal += int(thisFlights)
	

def main():
    import io
    sys.stdin = sys.__stdin__
    reducer()

if __name__=="__main__": 
   main()
