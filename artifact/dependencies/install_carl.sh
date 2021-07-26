#!/bin/bash
set -e
set -x

THREADS=$(nproc)
DEP_DIR=$PWD

unzip carl.zip
mv carl-master14 carl
mkdir -p carl/build
cd carl/build
cmake -DUSE_CLN_NUMBERS=ON -DUSE_GINAC=ON -DTHREAD_SAFE=ON ..
make lib_carl -j$THREADS
cd ../../
