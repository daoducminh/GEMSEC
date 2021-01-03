import os

CMDS = (
    '!cd GEMSEC && ./make_dirs.sh {0} {1}',
    '!cd GEMSEC && tsp ./run_ex.sh {0} {1}',
    '!cd GEMSEC && tsp ./save_result.sh {0} {1}'
)
MODELS = (
    'GEMSEC', 'GEMSECWithRegularization',
    'DeepWalk', 'DeepWalkWithRegularization'
)


def get_dataset(folder):
    a = os.listdir(folder)
    b = tuple(i[:-10] for i in a if '_edges.csv' in i)
    return b


if __name__ == "__main__":
    data = get_dataset('data/')
    for m in MODELS:
        for c in CMDS:
            for d in data:
                print(c.format(d, m))
            print('----')
        print('============')
