#!/bin/sh

SCENARIOS=scenarios.txt

SUITE=$1
ARGS=${2:-args.yaml}

grep ^scenarios/$SUITE/ $SCENARIOS |  xargs python yaml-merge.py > scenarios/$SUITE.yaml
TASK=scenarios/$SUITE.yaml

WEBROOT=/var/www/html
TIMESTAMP=`date +%Y%m%d_%H%M%S`
TASKNAME=$SUITE

HTML_REPORT=${WEBROOT}/${TIMESTAMP}_${TASKNAME}.html
JUNIT_REPORT=${WEBROOT}/${TIMESTAMP}_${TASKNAME}.xml

rally task start --task-args-file $ARGS $TASK 2>/dev/null

rally task report --html-static --out $HTML_REPORT
rally task report --junit --out $JUNIT_REPORT
