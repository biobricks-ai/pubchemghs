#!/usr/bin/env bash

# Script to unzip files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Set download path
downloadpath="$localpath/download"
echo "Download path: $downloadpath"

# Set list path
listpath="$localpath/list"
mkdir -p $listpath
echo "List path: $listpath"

# Create raw path
rawpath="$localpath/raw"
mkdir -p $rawpath
echo "Raw path: $rawpath"

# Unzip files in parallel
tar -xzvf $downloadpath/PubChemGHS.tar.gz -C $rawpath
find $rawpath -type f -name '*.csv' -printf '%f\n' | sed "s/.csv//" | sort > $listpath/files.txt
