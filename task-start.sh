#!/bin/sh

. $HOME/rally/bin/activate

export PYTHONWARNINGS="ignore:Unverified HTTPS request"

WEBROOT=/var/www/html
TIMESTAMP=`date +%Y%m%d_%H%M%S`
ARCHIVE=${WEBROOT}/archive/`date +%Y%m%d`

ARGS=args.yaml

run_task() {
	TASKNAME=$1
	FILENAME=$2

	REPORT=${ARCHIVE}/${TIMESTAMP}_${TASKNAME}.html

	rally task start --task-args-file $ARGS $FILENAME

	if [ $? -eq 0 ]; then
		rally task report --html-static --out ${REPORT}
	else
		echo "No report generated, task unsuccessful."
	fi
}

if [ ! -d $ARCHIVE ]; then
	mkdir -p $ARCHIVE
fi

FILENAME=$1
TASKNAME=`echo $FILENAME | sed -e s,scenarios/,, -e s,/,_,g -e s,.yaml,,`

run_task $TASKNAME $FILENAME
