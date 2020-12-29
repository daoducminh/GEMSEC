import sys
import pandas as pd
import numpy as np


def reindex(filename):
    df = pd.read_csv(filename)
    rs = set()
    for _, row in df.iterrows():
        rs.add(row['node_1'])
        rs.add(row['node_2'])
    return rs, df


def write_mapping(rs, filename, folder):
    with open('{0}/mapping/{1}'.format(folder, filename), 'w') as f:
        f.write('index,node\n')
        for index, value in enumerate(rs):
            f.write('{0},{1}\n'.format(index, value))


def replace_df(rs, df):
    a = {v: k for k, v in enumerate(rs)}
    df['node_1'] = df['node_1'].apply(lambda x: a[x])
    df['node_2'] = df['node_2'].apply(lambda x: a[x])
    df.to_csv(filename, index=False)
    df.to_csv('out/{0}'.format(filename), index=False)


if __name__ == "__main__":
    if len(sys.argv) == 2:
        filename = sys.argv[1]
        rs, df = reindex(filename)
        write_mapping(rs, filename, 'out')
        replace_df(rs, df)
