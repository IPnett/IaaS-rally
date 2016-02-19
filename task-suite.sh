#!/bin/sh

WEBROOT=/var/www/html
TIMESTAMP=`date +%Y%m%d_%H%M%S`

SCENARIOS=scenarios.txt
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

for suite in $@; do
	grep ^scenarios/$suite/ $SCENARIOS | xargs python yaml-merge.py > scenarios/$suite.yaml

	TASKNAME=$suite
	FILENAME=scenarios/$suite.yaml

	run_task $TASKNAME $FILENAME
done
