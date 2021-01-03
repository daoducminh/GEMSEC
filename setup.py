# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

setup(
    name='gemsec',
    version='1.0',
    author='minhdao',
    description='GEMSEC',
    packages=find_packages(exclude=[
        'docs',
        'tests',
        'static',
        'templates',
        '.gitignore',
        'README.md',
    ]),
    install_requires=[
        'networkx==2.4',
        'tqdm==4.19.5',
        'numpy==1.13.3',
        'pandas==0.20.3',
        'tensorflow==1.12.0',
        'jsonschema==2.6.0',
        'texttable==1.5.0',
        'python-louvain==0.11',
        'scikit-learn',
        'matplotlib'
    ]
)
