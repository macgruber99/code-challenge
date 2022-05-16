#!/bin/bash

terraform fmt -check -recursive || { echo 'Format check failed.'; exit 1; }
terraform validate || { echo 'Validation failed.'; exit 1; }
terraform plan || { echo 'Plan failed.'; exit 1; }
