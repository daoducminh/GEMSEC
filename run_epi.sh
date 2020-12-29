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

# Replace tab with comma
sed -i 's/\t/,/g' $1.txt

# Remove comments
tail -n +5 $1.txt > tmp1

# Add header
echo -e 'node_1,node_2' | cat - tmp1 > tmp2
mv tmp2 $1.csv
rm tmp1

# Reindex data
.venv/bin/python reindex.py $1.csv

# Run embedding
.venv/bin/python src/embedding_clustering.py --model $2 --dimensions 16 --num-of-walks 5 --random-walk-length 80 --cluster-number 20 --input $1.csv  --embedding-output out/embeddings/$1.csv --log-output out/cluster_means/$1.csv --cluster-mean-output out/logs/$1.csv --assignment-output out/assignment/$1.json

# Save result to gdrive
cp -rf out/ /content/gdrive/My\ Drive/Projects/
