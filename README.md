# Rally

## Create user/domain

   domain create --description Benchmarking rally.cloud.ipnett.se
   user create --domain rally.cloud.ipnett.se --password-prompt rally
   role add --domain rally.cloud.ipnett.se  --user-domain rally.cloud.ipnett.se --user rally _member_
   role add --domain rally.cloud.ipnett.se  --user-domain rally.cloud.ipnett.se --user rally admin
   role add --project rally.cloud.ipnett.se --user-domain rally.cloud.ipnett.se --user rally _member_
   role add --project rally.cloud.ipnett.se --user-domain rally.cloud.ipnett.se --user rally admin

