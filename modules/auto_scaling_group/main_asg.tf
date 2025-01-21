locals {
    ami = "ami-05576a079321f21f8" # using free-tier ami for now
    instance_type = var.is_prod ? "t2.large" : "t2.micro"
    environment_value = var.is_prod ? "Prod" : "Stage"
    user_data_path = var.user_data_path

    # These are the rules being applied for testing the EC2 && nginx server setup
    http_port = 80
    https_port = 443

    vpc_id = var.vpc_id
    subnet_id = var.subnet_id
}

resource "aws_launch_template" "launch_template" {
  image_id = local.ami
  instance_type = local.instance_type
  user_data = filebase64(local.user_data_path)
  tags = {
    "Environment" = local.environment_value
  }
  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_ingress_egress_rules.id]
  }
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  name = "asg-${local.subnet_id}"
  desired_capacity     = 3
  max_size             = 5
  min_size             = 3
  vpc_zone_identifier  = [local.subnet_id]
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

# Target Group Attachment
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
  lb_target_group_arn = var.target_group_arn
}

resource "aws_security_group" "ec2_ingress_egress_rules" {
  vpc_id = local.vpc_id

  # port 80 allowlisting is required to let the clients call the server
  ingress {
    to_port = local.http_port
    from_port = local.http_port
    protocol = "tcp"
    security_groups = [var.elb_sg_id]
  }   

  # port 443 allowlisting is required to let EC2 make https requests
  egress {
    to_port = local.https_port
    from_port = local.https_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}