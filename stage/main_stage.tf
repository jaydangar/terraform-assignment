provider "aws" {
  region = "us-east-1"
}

module "ec2-instances" {
  source = "../modules/ec2/"
  is_prod = false
  user_data_path = "../modules/ec2/bash.sh"
}