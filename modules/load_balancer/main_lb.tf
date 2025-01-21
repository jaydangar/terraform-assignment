resource "aws_lb" "load_balancer" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sg.id]
  subnets            = values(var.public_subnets)
}

resource "aws_security_group" "elb_sg" {
  vpc_id      = var.vpc_id

  ingress {
    description  = "Allow HTTP traffic"
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}