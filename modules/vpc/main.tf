resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true  # <-- Enable DNS Resolution
  enable_dns_hostnames = true  # <-- Enable DNS Hostnames

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id           = aws_vpc.main.id
  cidr_block       = var.public_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id           = aws_vpc.main.id
  cidr_block       = var.private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Main IGW"
  }
}

# Create an Elastic IP for the NAT Gateway (only if NAT is enabled)
resource "aws_eip" "nat" {
  count = var.create_nat_gateway ? 1 : 0
}

# Create NAT Gateway (only if NAT is enabled)
resource "aws_nat_gateway" "nat" {
  count = var.create_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "NAT Gateway"
  }
}
