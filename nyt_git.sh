#usr/bin/bash

# purpose: populate postgresql with latest covid data from NYTimes repo. refresh git repo, ingest into postgres, transform columns to dates and ints

# change director to where NYtimes repo has already been cloned
cd /var/covid/covid-19-data

# refresh the nytime github repo
/usr/bin/git pull

# copy these files into temp directory
cp /var/covid/covid-19-data/us-counties.csv /data/tmp/us-counties.csv
cp /var/covid/covid-19-data/us-states.csv /data/tmp/us-states.csv

# drop tables
psql -U $db_user -d $db_name -h $db_host -c "DROP TABLE IF EXISTS stage.nyt_us_counties"
psql -U $db_user -d $db_name -h $db_host -c "DROP TABLE IF EXISTS stage.nyt_us_states"

# execute python to handle import. pgfutter binary and other libraries required. pgfutter helpful because it creates tables
/usr/bin/python /var/covid/nytimes-data-example/nyt_data.py

# execute SQL to transform columns from text to [dates, ints, etc]
psql -U $db_user -d $db_name -h $db_host -f /var/covid/nytimes-data-example/sql/nytimes_etl.sql