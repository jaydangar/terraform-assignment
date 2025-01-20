resource "aws_vpc" "infra-vpc" {
  cidr_block = var.cidr_block
}