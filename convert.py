import json
import pickle
from matplotlib import pyplot as plt
import numpy as np

DATASETS = (
    'twitter_combined', 'government', 'athletes', 'tvshow', 'public_figure',
    'new_sites', 'politician', 'company', 'artist'
)
MODELS = (
    'GEMSEC', 'GEMSECWithRegularization',
    'DeepWalk', 'DeepWalkWithRegularization'
)
JSON_FILE = 'data/{1}/{0}.json'


def unpack(array):
    return tuple(i[1] for i in array)


def convert_result(filename):
    rs = []

    for d in DATASETS:
        for m in MODELS:
            with open(JSON_FILE.format(d, m), 'r') as f:
                a = json.load(f)
                a['times'] = unpack(a['times'])
                a['losses'] = unpack(a['losses'])
                a['modularity'] = unpack(a['cluster_quality'])
                a['model'] = a['params']['model']
                a['data'] = a['params']['log_output'][9:-5]
                del a['params']
                del a['cluster_quality']
                rs.append(a)
    with open(filename, 'wb') as f:
        pickle.dump(rs, f)
    return rs


def plot(data):
    fig, (ax1, ax2) = plt.subplots(2)
    fig.suptitle('{} - {}'.format(data['data'], data['model']))

    ax1.set_xlabel('epoch')
    ax1.set_ylabel('modularity')
    ax1.set_xticks([0, 1, 2, 3, 4])
    ax1.plot(data['modularity'], 'b')

    ax2.set_xlabel('epoch')
    ax2.set_ylabel('loss')
    ax2.set_xticks([0, 1, 2, 3, 4])
    ax2.plot(data['losses'], 'r')

    fig.tight_layout()
    fig.savefig('image/{}_{}.jpg'.format(data['model'], data['data']))
    plt.close(fig)


def draw_result(filename):
    with open(filename, 'rb') as f:
        a = pickle.load(f)
        for i in a:
            plot(i)


if __name__ == "__main__":
    filename = 'data/data.pkl'
    # convert_result(filename)
    draw_result(filename)
