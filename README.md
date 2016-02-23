# OpenStack Rally for IPnett Cloud Services

This directory contains configuration and testcases for OpenStack Rally at
IPnett Cloud Services.

## Keystone Bootstrap

The following keystone commands are used for bootstrapping, do not use without
prior knowledge of the current setup.

    domain create --description Benchmarking rally.cloud.ipnett.se
    project create --description Benchmarking rally.cloud.ipnett.se
    user create --domain rally.cloud.ipnett.se --password-prompt rally
    role add --domain rally.cloud.ipnett.se  --user-domain rally.cloud.ipnett.se --user rally _member_
    role add --domain rally.cloud.ipnett.se  --user-domain rally.cloud.ipnett.se --user rally admin
    role add --project rally.cloud.ipnett.se --user-domain rally.cloud.ipnett.se --user rally _member_
    role add --project rally.cloud.ipnett.se --user-domain rally.cloud.ipnett.se --user rally admin
