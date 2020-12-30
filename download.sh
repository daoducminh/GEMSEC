#!/bin/bash

GZ="txt.gz"

# Make all directories
mkdir -p out/embeddings/
mkdir -p out/cluster_means/
mkdir -p out/logs/
mkdir -p out/assignment/
mkdir -p out/mapping/

# Remove
rm -rf $1.txt
rm -rf $1.csv

# Download dataset
wget -q "https://snap.stanford.edu/data/$1.$GZ" && gunzip -k "$1.$GZ" && rm "$1.$GZ"