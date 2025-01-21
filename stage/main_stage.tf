provider "aws" {
  region = "us-east-1"
}

module "auto_scaling_group" {
  source         = "../modules/auto_scaling_group"
  for_each       = module.subnets.private_subnets
  is_prod        = false
  user_data_path = "../modules/auto_scaling_group/bash.sh"
  subnet_id      = each.value
  vpc_id         = module.vpc.vpc_id
  elb_sg_id      = module.load_balancer.elb_sg_id
  target_group_arn = module.load_balancer.target_group_arn
}

module "vpc" {
  source     = "../modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "../modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  for_each = module.subnets.public_subnets
  source = "../modules/route_table"
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.igw.igw_id
  subnet_id = each.value
}

module "igw" {
  source = "../modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source = "../modules/load_balancer"
  public_subnets = module.subnets.public_subnets
  vpc_id = module.vpc.vpc_id
}