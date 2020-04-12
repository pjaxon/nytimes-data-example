# nytimes-data-example
Example code to share one way to consume NYTimes COVID data

This repo does not go into detail about how to setup all the dependencies, but here are some basics:
- python 2.7 required, but could very easily use python 3+
- pyscopg2 required... "pip install pyscopg2 --user"  (or similar syntax)
- pgfutter must exist as an executable at /etc/pgfutter/pgfutter
- /data/tmp directory must exist
- NYtime repo should be cloned into "/var/covid" so that it exists at "/var/covid/covid-19-data/"
- This repo should be cloned into "/var/covid" so that it exists at "/var/covid/nytimes-data-example/"
