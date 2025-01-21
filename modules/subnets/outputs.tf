output "public_subnets" {
    description = "Provides IP Ranges for public subnets"
    value = {
        "public_subnet_1" = aws_subnet.public_subnet_1.id
        "public_subnet_2" = aws_subnet.public_subnet_2.id
        "public_subnet_3" = aws_subnet.public_subnet_3.id
    }
}

output "private_subnets" {
    description = "Provides IP Ranges for private subnets"
    value = {
        "private_subnet_1" = aws_subnet.private_subnet_1.id
        "private_subnet_2" = aws_subnet.private_subnet_2.id
        "private_subnet_3" = aws_subnet.private_subnet_3.id
    }
}