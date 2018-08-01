#!/usr/bin/env bash

host=${1:-localhost}
port=${2:-5432}

executing_user=${4:-$USER}
executing_password=${5:-}

cd database-setup

./destroy-db.sh mod_calendar_test test_tenant_mod_calendar mod_calendar_test_admin ${host} ${port} ${executing_user} ${executing_password}

# Drop the tenant based role as well, because deactivation no longer calls the Tenant API
./drop-role.sh test_tenant_mod_calendar

cd ..
