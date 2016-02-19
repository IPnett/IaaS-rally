#!/bin/sh

SUITES=""
SUITES="$SUITES authenticate"
#SUITES="$SUITES keystone"
#SUITES="$SUITES quotas"
SUITES="$SUITES glance"
SUITES="$SUITES cinder"
SUITES="$SUITES neutron"
SUITES="$SUITES nova"
SUITES="$SUITES ceilometer"
#SUITES="$SUITES heat"

cd `dirname $0`
sh suite-start.sh $SUITES
