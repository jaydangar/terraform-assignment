output "user_data_path" {
  description = "To validate if the user_data script is being deployed"
  value = local.user_data_path
}

output "aws_security_group_id" {
  description = "Prints the value of the Security Group ID"
  value = aws_security_group.ec2_ingress_egress_rules.id
}

output "name" {
  description = "Prints the value of the Auto Scaling Group Name"
  value = aws_autoscaling_group.auto_scaling_group.name
}