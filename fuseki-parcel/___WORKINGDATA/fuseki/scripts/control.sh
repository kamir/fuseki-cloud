#!/bin/bash

export FUSEKI_HOME=/opt/fuseki/scripts/main/apache-jena-fuseki-2.6.0

export FUSEKI_BASE=/opt/fuseki/fuseki-parcel/run

export JAVA_HOME=$PRIVATE_JAVA_HOME

#
# Here we use a CLI parameter to define a location of the modelfile and the port.
#
CMD=$1

MODEL_FILE=/GITHUB/FusekiCloud/fuseki-parcel/___WORKINGDATA/fuseki/scripts/main/data/model_DATA_TEMP
CORE_MODEL_FILE=/GITHUB/FusekiCloud/fuseki-parcel/___WORKINGDATA/fuseki/scripts/main/data/model.ttl

#$DEFAULT_GRAPH

PORT=3030
#$WEBSERVER_PORT

PART_FOLDER=/GITHUB/FusekiCloud/fuseki-parcel/___WORKINGDATA/fuseki/scripts/main/data/partitions  
#/home/cloudera/.etosha

#
# We need a time stamp 
#
####### TS=$(time)

######################################
#
#  Etosha Triple Collector Service
#
echo "        FUSEKI_HOME: $FUSEKI_HOME"
echo "          JAVA_HOME: $JAVA_HOME"
echo "               PORT: $WEBSERVER_PORT"
echo "    CORE_MODEL_FILE: $CORE_MODEL_FILE"
echo " ETOSH-GRAPH-FOLDER: $PART_FOLDER"
    
case $CMD in
  (start)
    clear


    echo ">>> Starting the Fuseki-Server on port [$WEBSERVER_PORT] (default: 3030)"

    # clean 
    # ### BE CAREFULL ### rm -r $PART_FOLDER -f
    #
    ########    mv $PART_FOLDER /tmp/$TS-ETOSHA-PARTITION-OLD
    
    # load files to local from HDFS default location
	########    hdfs dfs -get /etosha/snap/* $PART_FOLDER  
    echo $FUSEKI_HOME/fuseki-server --loc=$MODEL_FILE --update --port=$WEBSERVER_PORT /ETCS &

##    exec $FUSEKI_HOME/fuseki-server --loc=$MODEL_FILE --update --port=$WEBSERVER_PORT /ETCS &
    exec $FUSEKI_HOME/fuseki-server --mem --update --port=$WEBSERVER_PORT /ds &

	sleep 3

    FILES=$PART_FOLDER/*
    for f in $FILES
    do
      echo "> LOAD ETOSH-GRAPH-SNAPHSOT: $f ..."
      # take action on each file. $f store current file name
      $FUSEKI_HOME/bin/s-post http://127.0.0.1:$WEBSERVER_PORT/ds/data default $f
    done
    ;;

  (list)
      $FUSEKI_HOME/bin/s-query --service http://localhost:$WEBSERVER_PORT/ETCS/query 'SELECT * {?s ?p ?o}'
    ;;

  (reload)
 
    ;;
    
  (*)
    echo "Don't understand [$CMD]"
    ;;

esac
