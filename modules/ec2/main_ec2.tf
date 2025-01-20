locals {
    ami = "ami-05576a079321f21f8" # using free-tier ami for now
    instance_type = var.is_prod ? "t2.large" : "t2.micro"
    environment_value = var.is_prod ? "Prod" : "Stage"
    user_data_path = var.user_data_path
}

resource "aws_instance" "ec2-instance" {
  ami = local.ami
  instance_type = local.instance_type
  user_data = filebase64(local.user_data_path)
  tags = {
    "Environment" = local.environment_value
  }
  vpc_security_group_ids = [ aws_security_group.ec2-ingress-egress-rules.id ]
}

# This is the temporary rules being applied for testing the EC2 && Http server setup
resource "aws_security_group" "ec2-ingress-egress-rules" {
  name = "EC2-ingress-egress-rules"
  ingress {
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   

  ingress {
    to_port = 80
    from_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   

  egress {
    to_port = 443
    from_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}