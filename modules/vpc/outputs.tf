output "vpc_id" {
  description = "Prints Id of the VPC created"
  value = aws_vpc.main_vpc.id
}