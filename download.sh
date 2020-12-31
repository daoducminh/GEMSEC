#!/bin/bash

GZ="txt.gz"

# Remove
rm -rf $1.txt
rm -rf $1.csv

# Download dataset
wget -q "https://snap.stanford.edu/data/$1.$GZ" && gunzip -k "$1.$GZ" && rm "$1.$GZ"
