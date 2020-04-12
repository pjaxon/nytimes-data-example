# nytimes-data-example
Example code to share one way to consume NYTimes COVID data and refresh it on a schedule of your choosing using cron or other mechanism.

This repo does not go into detail about how to setup all the dependencies, but here are some basics:
- NYtimes repo (https://github.com/nytimes/covid-19-data) should already be cloned into "/var/covid" so that it exists at "/var/covid/covid-19-data/" It will refresh automatically when the code from this repo is installed, configured and successfully run.  future iterations of this code could initialize this and other dependencies
- python 2.7 required, but could very easily use python 3+
- pyscopg2 required... "pip install pyscopg2 --user"  (or similar syntax)
- pgfutter must exist as an executable at /etc/pgfutter/pgfutter
- /data/tmp directory must exist
- environmental variables for the $db_name, $db_host, $db_user must exist
- .pgpass with credentials must exist at ~/.pgass
- postgresql server must be available to deliver the data (either locally hosted or elsewhere)
- postgresql database name that is defined in your environmental variables must exist and must have a "stage" schema.
- This repo should be cloned into "/var/covid" so that it exists at "/var/covid/nytimes-data-example/"


After all dependencies are met, code can be run by "/var/covid/nytimes-data-example/nyt_git.sh" or by ./nyt_git.sh if you run it directly from the repo directory
