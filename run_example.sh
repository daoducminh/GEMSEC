#!/bin/sh

# Creating a GEMSEC embedding of the default dataset with the default hyperparameter settings. Saving the embedding, cluster centres and the log file at the default path.
.venv/bin/python src/embedding_clustering.py

# Creating a DeepWalk embedding of the default dataset with the default hyperparameter settings. Saving the embedding, cluster centres and the log file at the default path.
.venv/bin/python src/embedding_clustering.py --model DeepWalk

# Creating an embedding of an other dataset the Facebook Companies. Saving the output and the log in a custom place.
.venv/bin/python src/embedding_clustering.py --input data/company_edges.csv  --embedding-output output/embeddings/company_embedding.csv --log-output output/cluster_means/company_means.csv --cluster-mean-output output/logs/company.json

# Creating a clustered embedding of the default dataset in 32 dimensions, 20 sequences per source node with length 160 and 10 cluster centers.
.venv/bin/python src/embedding_clustering.py --dimensions 32 --num-of-walks 20 --random-walk-length 160 --cluster-number 10
