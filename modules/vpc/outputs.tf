output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

# Add missing output for Internet Gateway
output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

# Add missing output for NAT Gateway (Optional)
output "nat_gateway_id" {
  value = var.create_nat_gateway ? aws_nat_gateway.nat[0].id : null
}

