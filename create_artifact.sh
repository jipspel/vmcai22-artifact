#!/bin/bash
#set -e Somehow the wget command ends with 4
set -x

ROOT_DIR=$PWD
ART_ROOT_DIR=$ROOT_DIR/storm # The .zip file should have a readme next to the actual artifact
ART_DIR=$ART_ROOT_DIR/artifact
DEP_DIR=$ART_DIR/dependencies
PACK_DIR=$DEP_DIR/apt-packages
STORM_TAG=tacas2021
#############################
### Download apt-packages ###
#############################
PACK_URIS=$DEP_DIR/packages.uri

mkdir -p $PACK_DIR

# Get URIs of the needed packages
sudo apt-get update
apt-get install --print-uris libgmp-dev libglpk-dev libhwloc-dev z3 libboost-all-dev libeigen3-dev libginac-dev libpython3-dev automake graphviz | grep -oP "(?<=').*(?=')" > $PACK_URIS 

# Download the needed packages
cd $PACK_DIR
wget -i $PACK_URIS
cd $ROOT_DIR


####################################
### Download Carl ###
####################################
wget -O $DEP_DIR/carl.zip https://github.com/smtrat/carl/archive/master14.zip

# Copy Storm adjustments
cp -r storm_3rdparty_CMakeLists.txt StormEigen $DEP_DIR

#################################
### Download Storm tool suite ###
#################################
cp -r storm.zip $DEP_DIR


# Copy installation scripts
cp install_carl.sh $DEP_DIR
cp install_dependencies.sh install_storm.sh $ART_DIR

# Copy README.md
cp README_artifact.md $ART_ROOT_DIR/README.md
cp LICENSE $ART_ROOT_DIR

cd $ART_ROOT_DIR 
zip storm-artifact.zip artifact/* LICENSE README.md -r
