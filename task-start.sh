#!/bin/sh

TASK=$1
ARGS=${2:-args.yaml}

WEBROOT=/var/www/html
TIMESTAMP=`date +%Y%m%d_%H%M%S`
TASKNAME=`echo $TASK | sed -e s,scenarios/,, -e s,/,_,g -e s,.yaml,,`

HTML_REPORT=${WEBROOT}/${TIMESTAMP}_${TASKNAME}.html
JUNIT_REPORT=${WEBROOT}/${TIMESTAMP}_${TASKNAME}.xml

rally task start --task-args-file $ARGS $TASK 2>/dev/null

rally task report --html-static --out $HTML_REPORT
rally task report --junit --out $JUNIT_REPORT
