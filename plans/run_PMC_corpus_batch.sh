#!/bin/bash

BATCH_NB=$1 # get the number of the batch to process
CONFIG_FILE=$2 # get the configuration file to use

RAM=30g

# import variables
. $CONFIG_FILE

# run the pipeline
batch=$(printf "%0.2d" $BATCH_NB)
$ALVISDIR/bin/alvisnlp -J "-Xmx30g" -verbose -inputDir $CORPUSDIR/batch/$batch -inputDir $YATEACONFIG -inputDir $SOFTWAREDIR -outputDir $OUTPUTDIR/$batch -inputDir $OUTPUTDIR/$batch -entity ontology $ONTOLOGYNAME plans/tag_and_index_PMC.plan

