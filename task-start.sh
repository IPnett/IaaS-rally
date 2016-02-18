#!/bin/sh

TASK=$1

TEMP_TASK=task.$$.yaml.tmp

cat variables.txt $TASK > $TEMP_TASK
rally task start $TEMP_TASK  2>/dev/null
#rm -f $TEMP_TASK
