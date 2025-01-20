output "ec2_arn" {
  description = "Prints the value of the ARN of EC2 Instance"
  value = aws_instance.ec2-instance.arn
}

output "user_data_path" {
  description = "To validate if the user_data script is being deployed"
  value = local.user_data_path
}