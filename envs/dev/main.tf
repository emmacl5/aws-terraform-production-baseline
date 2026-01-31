locals {
  name = "aws-tf-baseline-dev"

  tags = {
    project = "aws-tf-baseline"
    env     = "dev"
  }
}

module "network" {
  source = "../../modules/network"

  name                      = local.name
  vpc_cidr                  = "10.10.0.0/16"
  az_count                  = 3
  enable_single_nat_gateway = true
  tags                      = local.tags
}
