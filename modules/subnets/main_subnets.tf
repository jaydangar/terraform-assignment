data "aws_availability_zones" "available_zones" {
  state = "available"
}

locals {
  private_cidr_blocks = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"] 
  public_cidr_blocks = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/19"] 
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  cidr_block = local.public_cidr_blocks[0]
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  cidr_block = local.public_cidr_blocks[1]
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[2]
  cidr_block = local.public_cidr_blocks[2]
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[3]
  cidr_block = local.private_cidr_blocks[0]
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[4]
  cidr_block = local.private_cidr_blocks[1]
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.available_zones.names[5]
  cidr_block = local.private_cidr_blocks[2]
}
