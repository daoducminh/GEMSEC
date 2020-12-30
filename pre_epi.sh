#!/bin/bash

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