#!/usr/bin/env sh

set -e

projectDir=/home/sgdd/CMakeProject
test -e "$projectDir/build" && rm -r "$projectDir/build"
mkdir "$projectDir/build"
cd "$projectDir/build"

cmake .. -DCMAKE_INSTALL_PREFIX=/tmp

make

make install

