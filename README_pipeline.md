# Running the TDM pipeline for the AS-D Wheat Phenotype Search application

## Repository content

- alvisIR/ : configuration files for the search engine
- corpus/ : corpora used in the application
- plans/ : AlvisNLP workflow plans and scripts used to create the application (annotate and index corpora, pre-process resources, etc.)
- resources/ : resources used in the application (lexicons, ontology, etc.)

## Prerequisites for running the TDM pipeline

- AlvisNLP/ML processing pipeline (available at https://github.com/Bibliome/alvisnlp)
- Java >= 7
- TreeTagger tool (available at http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/)
- YaTeA term extractor (available at http://search.cpan.org/~thhamon/Lingua-YaTeA/)

## Annotating and indexing the corpus of Web of Science abstracts (located in corpus/WoS-abstracts-2017/)

1. update the config.sh script (provide full paths to required folders)
2. run the pipeline (plans/run_WoS_abstracts_batch.sh) for each batch of abstracts (the corpus is divided into 4 batches, see the corpus/WoS-abstracts-2017 folder)
```
  plans/run_WoS_abstracts_batch.sh BATCH-NUMBER plans/config.sh
  ```
3. once all batches of the corpus are annotated and indexed, create the final search engine index by running the create_alvisIR_index.sh script


