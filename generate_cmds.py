import os

CMD = '!cd GEMSEC && tsp ./run_ex.sh {0} {1}'
MODELS = [
    'GEMSEC', 'GEMSECWithRegularization',
    'DeepWalkWithRegularization', 'DeepWalk'
]


def get_dataset(folder):
    a = os.listdir(folder)
    b = tuple(i[:-10] for i in a if '_edges.csv' in i)
    return b


if __name__ == "__main__":
    data = get_dataset('data/')
    for m in MODELS:
        for d in data:
            print(CMD.format(d, m))
        print('============')
