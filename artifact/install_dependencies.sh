#!/bin/bash
set -e
set -x


cd dependencies

dpkg -i apt-packages/*.deb
./install_carl.sh
cd -
