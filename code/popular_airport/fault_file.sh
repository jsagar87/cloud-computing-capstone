#!/bin/bash

SOURCE_FOLDER=$1

old_wd=`pwd`
cd $SOURCE_FOLDER

## Iterating all the folders for zip
for i in `find . -iname "*.zip"`; do
	
        ## unzipping the each of the zip file into a temporary directory
        ## Command used : unzip
        ##                  -o option to overright the file at output location if it already exists
        ##                  -d poiting unzip command where to unzip file


        unzip -p $i *.csv |\
		    head -n 1 |\
			 grep -o -w "Origin"

	if [ $? -ne 0 ] ; then
	    echo $i
	fi
done
