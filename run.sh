#!/bin/bash

GZ="txt.gz"

# Make all directories
mkdir -p out/embeddings/
mkdir -p out/cluster_means/
mkdir -p out/logs/
mkdir -p out/assignment/

# Download dataset
wget -q "https://snap.stanford.edu/data/$1.$GZ" && gunzip -k "$1.$GZ" && rm "$1.$GZ"

# Run embedding
.venv/bin/python src/embedding_clustering.py --dimensions 32 --num-of-walks 20 --random-walk-length 160 --cluster-number 10 --input $1.txt  --embedding-output out/embeddings/$1.csv --log-output out/cluster_means/$1.csv --cluster-mean-output out/logs/$1.csv --assignment-output out/assignment/$1.json

# Save result to gdrive
cp -rf out/ /content/gdrive/My\ Drive/Projects/