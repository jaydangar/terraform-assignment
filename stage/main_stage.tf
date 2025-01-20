provider "aws" {
  region = "us-east-1"
}

module "private_ec2_instances" {
  source          = "../modules/ec2/"
  for_each        = {
    subnet1 = { subnet_id = module.subnets.private_subnet1 }
    subnet2 = { subnet_id = module.subnets.private_subnet2 }
    subnet3 = { subnet_id = module.subnets.private_subnet3 }
  }
  is_prod         = false
  user_data_path  = "../modules/ec2/bash.sh"
  subnet_id       = each.value.subnet_id
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "../modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "../modules/subnets"
  vpc_id = module.vpc.vpc_id
}