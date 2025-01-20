output "public_subnet1" {
    description = "Provides IP Ranges for public subnet"
    value = aws_subnet.public_subnet_1.id
}

output "public_subnet2" {
    description = "Provides IP Ranges for public subnet"
    value = aws_subnet.public_subnet_2.id
}

output "public_subnet3" {
    description = "Provides IP Ranges for public subnet"
    value = aws_subnet.public_subnet_3.id
}

output "private_subnet1" {
    description = "Provides IP Ranges for private subnet"
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet2" {
    description = "Provides IP Ranges for private subnet"
    value = aws_subnet.private_subnet_2.id
}

output "private_subnet3" {
    description = "Provides IP Ranges for private subnet"
    value = aws_subnet.private_subnet_3.id
}