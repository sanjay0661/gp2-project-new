output "vpc_id" {
  value = aws_vpc.main.id  # Change "this" to "main"
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id  # Change "this" to "igw"
}

output "nat_gateway_id" {
  value = var.create_nat_gateway ? aws_nat_gateway.nat[0].id : null  # Change "this" to "nat"
}
