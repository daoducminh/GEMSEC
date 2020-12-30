#!/bin/bash

# Run embedding
.venv/bin/python src/embedding_clustering.py --model $2 --dimensions 16 --num-of-walks 5 --random-walk-length 80 --cluster-number 20 --input data/$1_edges.csv  --embedding-output out/embeddings/$1.csv --log-output out/logs/$1.json --cluster-mean-output out/cluster_means/$1.csv --assignment-output out/assignment/$1.json

# Save result to gdrive
cp -rf out/ /content/gdrive/My\ Drive/Projects/$1/$2/
