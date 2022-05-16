locals {
  tags = {
    terraform_managed = true
    terraform_module  = basename(abspath(path.module))
  }
}