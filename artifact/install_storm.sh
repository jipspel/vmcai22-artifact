#!/bin/bash
set -e
set -x

THREADS=$(nproc)

mkdir -p storm/build
cd storm/build
mkdir -p include/resources/3rdparty/
cp -r ../../StormEigen include/resources/3rdparty/
cmake ..
make storm-pars-cli -j$THREADS
cd ../../
