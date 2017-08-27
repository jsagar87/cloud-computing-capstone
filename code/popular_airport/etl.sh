#!/bin/bash
 
function usage(){
        local usage_text='Command need exact two parameters. 1st Path to data-source folder on local system. 2nd HDFS location of target' 
}

usage

## Defining a temporary file-location to unzip all zip file
TEMP_DIR=/tmp/data_dir

## Folder location to read from local system
SOURCE_FOLDER=$1

## Target directory for HDFS
HDFS_TARGET_LOCATION=$2
echo $HDFS_TARGET_LOCATION

## Step 1 Unzip and extract locally before uploading to HDFS,
##        so that we can handle any zip file error

## Change to base folder, store present location before that
old_wd=`pwd`
cd $SOURCE_FOLDER

## Iterating all the folders for zip
for i in `find . -iname "*.zip"`; do
        ## unzipping the each of the zip file into a temporary directory
        ## Command used : unzip
        ##                  -o option to overright the file at output location if it already exists
        ##                  -d poiting unzip command where to unzip file
        unzip -o $i -d $TEMP_DIR *.csv
done

## changing back to old working directory
cd $old_wd

## Step 2 upload to HDFS
ls $TEMP_DIR
hdfs dfs -copyFromLocal /tmp/data_dir/* /hduser/aviation/airline_ontime/

## Step 3 clean up

## Clear teamp library before leaving
rm -rf $TEMP_DIR/*
