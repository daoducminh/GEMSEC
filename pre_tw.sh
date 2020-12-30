#!/bin/bash

# Replace whitespace with comma
sed -i 's/ /,/g' $1.txt

# Add header
echo -e 'node_1,node_2' | cat - $1.txt > tmp
mv tmp $1.csv

# Reindex data
.venv/bin/python reindex.py $1.csv