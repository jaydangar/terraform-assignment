variable "is_prod" {
  description = "Used to determine if this is a prod environment"
  type = bool
}

variable "user_data_path" {
  description = "Provides user data path for setting up the server"
  type = string
}

variable "subnet_id" {
  description = "Provides subnet id for setting up the server"
  type = string
}

variable "vpc_id" {
  description = "Provides VPC id for setting up the server"
  type = string
}

variable "elb_sg_id" {
  description = "Provides Elastic Load Balancer Security Group id for setting up the server"
  type = string
}

variable "target_group_arn" {
  description = "Provides Target Group ARN for setting up the server"
  type = string
}
