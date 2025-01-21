locals {
    vpc_id = var.vpc_id
    subnet_id = var.subnet_id
    igw_id = var.internet_gateway_id
}

resource "aws_route_table" "route_table" {
  vpc_id = local.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.igw_id
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = local.subnet_id
  route_table_id = aws_route_table.route_table.id
}
