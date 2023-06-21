#!/usr/bin/env python

from pkg_resources import DistributionNotFound, get_distribution
from setuptools import setup


def get_dist(package):
    try:
        return get_distribution(package)
    except DistributionNotFound:
        return None


tensorflow = []

# don't install tensorflow if tensorflow-gpu is installed and vice versa
if get_dist("tensorflow") is None and get_dist("tensorflow-gpu") is None:
    tensorflow.append("tensorflow")

# run setup
setup(
    name="voxelmorph",
    version="0.1",
    license="Apache 2.0",
    description="Image Registration with Convolutional Networks",
    url="https://github.com/voxelmorph/voxelmorph",
    keywords=["deformation", "registration", "imaging", "cnn", "mri"],
    packages=["voxelmorph"],
    python_requires=">=3.6",
    classifiers=[
        "Intended Audience :: Science/Research",
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    install_requires=[
        "packaging",
        "scikit-image",
        "h5py",
        "numpy",
        "scipy",
        "nibabel",
        "neurite>=0.2",
    ]
    + tensorflow,
)
