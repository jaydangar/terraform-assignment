provider "aws" {
  region = "us-east-1"
}

module "private_ec2_instances" {
  source         = "../modules/ec2/"
  for_each       = module.subnets.public_subnets
  is_prod        = false
  user_data_path = "../modules/ec2/bash.sh"
  subnet_id      = each.value
  vpc_id         = module.vpc.vpc_id
}

module "vpc" {
  source     = "../modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "../modules/subnets"
  vpc_id = module.vpc.vpc_id
}
