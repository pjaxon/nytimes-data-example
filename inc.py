#!/usr/bin/python

# pip install pyscopg2 (and its dependencies) required first
import psycopg2
from psycopg2.extras import DictCursor
import os
import sys
import re

from datetime import datetime, timedelta

tmp_filepath = '/data/tmp/'

#purpose: process a csv into a postgresql table.
# requires pgfutter to be installed, executable and exists at /etc/pgfutter/pgfutter
# also requires .pgpass file located in ~/.pgpass
# also requires postgres server either locally or elsewhere
def import_csv(file_name, table_name, db_schema = 'stage', error_switch = '--ignore-errors', header_switch = '', data_type = 'csv', delimitter = ',' ):

  # construct string for pgfutter command
  pgfutter_command = "/etc/pgfutter/pgfutter " + error_switch + " --schema " + db_schema + " --table '" + table_name + "' --dbname " + os.environ['db_name'] + " --host  " + os.environ['db_host'] + " --user " + os.environ['db_user'] + " --pass '" + os.environ['db_credentials'] + "' " + data_type + " " + header_switch + " -d '" + delimitter + "' " + " '" + tmp_filepath + file_name + "'"

  #execute pgfutter_command
  os.system (pgfutter_command)

  #now delete the files used for this import
  os.system('rm ' + tmp_filepath + file_name )

  return 1