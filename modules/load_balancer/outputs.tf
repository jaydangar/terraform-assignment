output "elb_sg_id" {
  description = "value of the Security Group ID"
  value       = aws_security_group.elb_sg.id
}

output "target_group_arn" {
  description = "value of the Target Group ARN"
  value       = aws_lb_target_group.target_group.arn
}