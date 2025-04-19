# multi-gpu-db

This repository is a collection of scripts for experiments running TPC-H and SSB benchmarks on HeavyDB.

# Directories

## ssb
Contains SQL files for running SSB

## tpch
Contains SQL files for running TPC-H

## test
`heavyai_utils.py` is a helper class for running HeavyDB. It is implemented on top of `heavyai`, a python wrapper for interfacing `heavysql`.

## utils
Utility scripts related to docker installation