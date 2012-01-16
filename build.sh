#!/bin/bash

PROGS="bayes genome intruder kmeans labyrinth ssca2 vacation yada"
TARGETS="seq tl2 tinystm"

for t in ${TARGETS}
do
    for p in ${PROGS}
    do
    	make -C ${p} -f  Makefile TARGET=${t} $*
	if [ $? -ne 0 ]; then
	    exit -1
	fi
    done     	
done