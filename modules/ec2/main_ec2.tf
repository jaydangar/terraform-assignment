locals {
    ami = "ami-05576a079321f21f8" # using free-tier ami for now
    instance_type = var.is_prod ? "t2.large" : "t2.micro"
    environment_value = var.is_prod ? "Prod" : "Stage"
    user_data_path = var.user_data_path

    # These are the rules being applied for testing the EC2 && Http server setup
    ssh_port = 22
    http_port = 80
    https_port = 443

    vpc_id = var.vpc_id
    subnet_id = var.subnet_id
}

resource "aws_instance" "ec2-instance" {
  ami = local.ami
  instance_type = local.instance_type
  user_data = filebase64(local.user_data_path)
  tags = {
    "Environment" = local.environment_value
  }
  vpc_security_group_ids = [ aws_security_group.ec2_ingress_egress_rules.id ]
  subnet_id = local.subnet_id
} 

resource "aws_security_group" "ec2_ingress_egress_rules" {
  vpc_id = local.vpc_id

  # TODO: 22 allowlisting is temporary and needs to be removed after the final infrastructure testing
  ingress {
    to_port = local.http_port
    from_port = local.http_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   

  # port 80 allowlisting is required to let the clients call the server
  ingress {
    to_port = local.http_port
    from_port = local.http_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   

  # port 443 allowlisting is required to let EC2 make https requests
  egress {
    to_port = local.https_port
    from_port = local.https_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}