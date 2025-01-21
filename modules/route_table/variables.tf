variable "subnet_id" {
  description = "Provides subnet id for setting up the server"
  type = string
}

variable "vpc_id" {
  description = "Provides VPC id for setting up the server"
  type = string
}

variable "internet_gateway_id" {
  description = "Provides Internet gateway Id"
  type = string
}