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

# Replace whitespace with comma
sed -i 's/ /,/g' $1.txt

# Add header
echo -e 'node_1,node_2' | cat - $1.txt > tmp
mv tmp $1.csv

# Reindex data
.venv/bin/python reindex.py $1.csv

# Run embedding
.venv/bin/python src/embedding_clustering.py --model DeepWalk --dimensions 32 --num-of-walks 5 --random-walk-length 80 --cluster-number 10 --input $1.csv  --embedding-output out/embeddings/$1.csv --log-output out/cluster_means/$1.csv --cluster-mean-output out/logs/$1.csv --assignment-output out/assignment/$1.json

# Save result to gdrive
cp -rf out/ /content/gdrive/My\ Drive/Projects/