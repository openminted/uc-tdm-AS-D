#!/bin/bash

# Merge a corpus indexed in several parts into one index to be used by the AlvisIR search engine 

INPUT_DIR=$1
OUTDIR_DIR=$2
#INPUT_DIR=/bibdev/travail/OpenMinted/UseCases/Wheat/uc-tdm-AS-D/output/WoS-abstracts-2017/
#OUTDIR_DIR=/bibdev/travail/OpenMinted/UseCases/Wheat/alvisIR/
LUCENE_PATH=/bibdev/travail/biotopes/PubMed2015/software/alvisnlp/trunk/lib/lucene-core-3.6.1.jar:/bibdev/sources/lucene/lucene-3.6.1/contrib/misc/lucene-misc-3.6.1.jar

# merge all parts of the indexed corpus
java -cp $LUCENE_PATH org.apache.lucene.misc.IndexMergeTool $OUTDIR_DIR/ $INPUT_DIR/*/index/

