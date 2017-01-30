# Use Case AS-D: Linking Wheat Data With Literature


The web application **Wheat Phenotype Search** for the AS-D use case is available at : http://bibliome.jouy.inra.fr/demo/wheat/alvisir/webapi/search

**The application is fully documented in the [AS-D_applicationDoc document](AS-D_applicationDoc.adoc).**

Besides the application documentation, the uc-tdm-AS-D repository also contains all configuration files, AlvisNLP workflow plans, scripts, corpora and resources used to create the AS-D search engine application.

- alvisIR/ : configuration files for the search engine
- corpus/ : corpora used in the application
- plans/ : AlvisNLP workflow plans and scripts used to create the application (annotate and index corpora, pre-process resources, etc.)
- resources/ : resources used in the application (lexicons, ontology, etc.)

## Prerequisites for running the TDM pipeline

The TDM pipeline to automatically annotate and index the application corpus may be re-run, provided the following prerequisites are met:

- AlvisNLP/ML processing pipeline (available at https://github.com/Bibliome/alvisnlp)
- Java >= 7
- TreeTagger tool (available at http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/)
- YaTeA term extractor (available at http://search.cpan.org/~thhamon/Lingua-YaTeA/)


Documentation for running the pipeline coming soon...
