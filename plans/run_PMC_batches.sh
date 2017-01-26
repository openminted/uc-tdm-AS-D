#!/bin/bash

NB1=$1
NB2=$2
CONFIG_FILE=$3

SCRIPT_DIR=$(dirname $0)

for nb in $(seq $NB1 $NB2)
do
    $SCRIPT_DIR/run_PMC_corpus_batch.sh $nb $CONFIG_FILE
done
