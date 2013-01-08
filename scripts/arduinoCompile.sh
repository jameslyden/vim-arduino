#!/bin/bash
# Build sketch, but do not deploy

echo =======================================
. $(dirname $0)/arduinoMakefile.sh
echo ""
echo Compiling sketch $sketch.
echo =======================================
echo ""

make -f$makefile

rm $makefile
