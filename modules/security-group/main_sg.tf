# These are the rules being applied for testing the EC2 && Http server setup

locals {
  ssh_port = 22
  http_port = 80
  https_port = 443
}

resource "aws_security_group" "ec2-ingress-egress-rules" {
  name = "EC2-ingress-egress-rules"

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