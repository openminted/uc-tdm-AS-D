#!/bin/bash

batch=$1 # get the number of the batch to process
CONFIG_FILE=$2 # get the configuration file to use

# import variables
. $CONFIG_FILE

# run the pipeline
$ALVISDIR/bin/alvisnlp -J-Xmx30g -verbose -alias input $CORPUSDIR/$CORPUSNAME-$batch.xml -inputDir $PWD -inputDir $SOFTWAREDIR -outputDir $OUTPUTDIR/$batch plans/tag_and_index_pubmed_abstracts.plan

