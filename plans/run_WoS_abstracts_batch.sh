#!/bin/bash

batch=$1 # get the number of the batch to process
CONFIG_FILE=$2 # get the configuration file to use

CORPUSNAME=WoS-ref_gene_marker_wheat-janv-17
RAM=30g

# import variables
. $CONFIG_FILE

# run the pipeline
$ALVISDIR/bin/alvisnlp -J "-Xmx30g" -verbose -entity inputfile $CORPUSDIR/$CORPUSNAME-part$batch -inputDir $PLANDIR -inputDir $SOFTWAREDIR -outputDir $OUTPUTDIR/part$batch -inputDir $OUTPUTDIR/part$batch -entity ontology $ONTOLOGY_NAME plans/tag_and_index_WoS_abstracts.plan

