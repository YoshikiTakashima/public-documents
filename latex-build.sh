#!/bin/bash
# latex-build.sh : script for building latex documents.

USAGE='latex-build.sh TARGET_DIR'

if [ "$#" -ne 1 ]; then
    echo 'USAGE'
    echo $USAGE
    exit 1
fi

TARGET_DIR=$1
BUILD_DIR=./build

grep '^# Note: build me with `latex-build.sh`$' $TARGET_DIR/Makefile 2> /dev/null 1> /dev/null
if [ "$?" -eq 0  ]; then # This directory is intended
    echo "Looks good! Using $TARGET_DIR"
    mkdir -p $BUILD_DIR
    rsync -avz $TARGET_DIR/* $BUILD_DIR
    touch $BUILD_DIR/Makefile
    make -C $BUILD_DIR
else
    echo "$TARGET_DIR does not have makefile with 'Note: build me with \`latex-build.sh\`' in it"
    echo
    echo 'This directory probably is not meant for this script.'
    exit 2
fi

