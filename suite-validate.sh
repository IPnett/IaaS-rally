#!/bin/sh

SCENARIOS=scenarios.txt
ARGS=args.yaml

validate_task() {
	TASKNAME=$1
	FILENAME=$2
	
	rally task validate --task-args-file $ARGS $FILENAME
}

for suite in $@; do
	grep ^scenarios/$suite/ $SCENARIOS | xargs python yaml-merge.py > scenarios/$suite.yaml

	TASKNAME=$suite
	FILENAME=scenarios/$suite.yaml

	validate_task $TASKNAME $FILENAME
done
