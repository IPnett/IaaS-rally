#!/bin/sh

SUITES=""
SUITES="$SUITES authenticate"
SUITES="$SUITES keystone"
SUITES="$SUITES quotas"
SUITES="$SUITES glance"
SUITES="$SUITES cinder"
SUITES="$SUITES neutron"
SUITES="$SUITES nova"
# Not activated yet
#SUITES="$SUITES ceilometer"
#SUITES="$SUITES heat"

# Fix missing network issues? We seem to require a shared network
openstack network set --share rally

LOGFILE=/var/log/rally/daily-`date +%Y%m%d`.log
ERRFILE=/var/log/rally/daily-`date +%Y%m%d`.stderr.log

cd `dirname $0`
sh suite-start.sh $SUITES >>$LOGFILE 2>>$ERRFILE

# Reset shared network
openstack network set --no-share rally
