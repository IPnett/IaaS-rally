#!/bin/sh

. $HOME/rally/bin/activate

export PYTHONWARNINGS="ignore:Unverified HTTPS request"

WEBROOT=/var/www/html
TIMESTAMP=`date +%Y%m%d_%H%M%S`
ARCHIVE=${WEBROOT}/archive/`date +%Y%m%d`

SCENARIOS=scenarios.txt
ARGS=args.yaml

run_task() {
	TASKNAME=$1
	FILENAME=$2
	
	REPORT=${ARCHIVE}/${TIMESTAMP}_${TASKNAME}.html

	rally task start --task-args-file $ARGS $FILENAME

	if [ $? -eq 0 ]; then
		rally task report --html-static --out ${REPORT}
		install -m 444 ${REPORT} ${WEBROOT}/latest/${TASKNAME}.html
	else
		echo "No report generated, task unsuccessful."
	fi
}

if [ ! -d $ARCHIVE ]; then
	mkdir -p $ARCHIVE
fi

if [ ! -d ${WEBROOT}/latest ]; then
	mkdir -p ${WEBROOT}/latest
fi

for suite in $@; do
	grep ^scenarios/$suite/ $SCENARIOS | xargs python yaml-merge.py > scenarios/$suite.yaml

	TASKNAME=$suite
	FILENAME=scenarios/$suite.yaml

	run_task $TASKNAME $FILENAME
done
