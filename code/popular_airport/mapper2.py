#!/usr/bin/python

import sys
import csv

def mapper():
    reader = csv.DictReader(sys.stdin, delimiter=',')
    for line in reader:
        if len(line) >=2:	    
	    print "{0}\t{1}".format(line['Origin'],1)
	    print "{0}\t{1}".format(line['Dest'],1)

def main():
    import io
    sys.stdin = sys.__stdin__
    mapper()

if __name__=="__main__": 
   main()
