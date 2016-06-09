# OpenStack Rally for IPnett Cloud Services

This directory contains configuration and testcases for OpenStack Rally at
IPnett Cloud Services.

## Keystone Bootstrap

The following keystone commands are used for bootstrapping, do not use without
prior knowledge of the current setup.

    domain create --description Benchmarking rally.ipnett.com
    project create --description Benchmarking rally.ipnett.com
    user create --domain rally.ipnett.com --password-prompt rally
    role add --domain rally.ipnett.com  --user-domain rally.ipnett.com --user rally _member_
    role add --domain rally.ipnett.com  --user-domain rally.ipnett.com --user rally admin
    role add --project rally.ipnett.com --user-domain rally.ipnett.com --user rally _member_
    role add --project rally.ipnett.com --user-domain rally.ipnett.com --user rally admin
