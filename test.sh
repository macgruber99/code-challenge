#!/bin/bash

terraform fmt -check ../
terraform validate
terraform plan
