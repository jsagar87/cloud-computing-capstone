#!/usr/bin/python

import sys
import csv

def mapper():
    for line in sys.stdin:
	# 'Origin' at 11
	# 'Destination' at 18
	data = line.strip().split(",")
        if len(data) >=2:	    
	    print "{0}\t{1}".format(data[11],1)
	    print "{0}\t{1}".format(data[18],1)

def main():
    import io
    sys.stdin = sys.__stdin__
    mapper()

if __name__=="__main__": 
   main()
