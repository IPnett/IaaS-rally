#!/bin/sh

WEBROOT=/var/www/html
TIMESTAMP=`date +%Y%m%d_%H%M%S`

ARGS=args.yaml

run_task() {
	TASKNAME=$1
	FILENAME=$2
	
	HTML_REPORT=${WEBROOT}/${TIMESTAMP}_${TASKNAME}.html
	JUNIT_REPORT=${WEBROOT}/${TIMESTAMP}_${TASKNAME}.xml

	rally task start --task-args-file $ARGS $FILENAME 2>/dev/null

	if [ $? -eq 0 ]; then
		rally task report --html-static --out $HTML_REPORT
		#rally task report --junit --out $JUNIT_REPORT
	fi
}

FILENAME=$1
TASKNAME=`echo $FILENAME | sed -e s,scenarios/,, -e s,/,_,g -e s,.yaml,,`

run_task $TASKNAME $FILENAME
