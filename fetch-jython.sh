#!/bin/sh

# Generate a source drop for jython
# Usage: sh fetch-jython.sh <TAG>

TAG=$1

rm -rf jython-$TAG
rm -rf jython-$TAG.tar.xz
hg clone -r "$TAG" https://hg.python.org/jython jython-$TAG

find jython-$TAG -type f -a -name *.jar -delete
find jython-$TAG -type f -a -name *.class -delete
find jython-$TAG -type f -a -name *.exe -delete
find jython-$TAG -type f -a -name *.dll -delete
rm -rf jython-$TAG/.hg

tar Jcf jython-$TAG.tar.xz jython-$TAG
rm -rf jython-$TAG
