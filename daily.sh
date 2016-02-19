#!/bin/sh

SUITES=""
SUITES="$SUITES authenticate"
#SUITES="$SUITES keystone"
SUITES="$SUITES quotas"
SUITES="$SUITES glance"
SUITES="$SUITES cinder"
SUITES="$SUITES neutron"
SUITES="$SUITES nova"
SUITES="$SUITES ceilometer"
#SUITES="$SUITES heat"

cd `dirname $0`

for $s in $SUITES; do
	sh suite-start.sh $s
done
