variable "public_subnets" {
  description = "public subnet"
  type        = map(string)
}

variable "vpc_id" {
  description = "Id of the VPC"
  type        = string
}
