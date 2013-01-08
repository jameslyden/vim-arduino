#!/bin/bash

echo =======================================
. $(dirname $0)/arduinoMakefile.sh
echo ""
echo Compiling sketch $sketch.
echo =======================================
echo ""

make -f$makefile upload

rm $makefile
