# Create Public NACL
resource "aws_network_acl" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Public NACL"
  }
}

# Create Private NACL
resource "aws_network_acl" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Private NACL"
  }
}

# Associate Public NACL with Public Subnets
resource "aws_network_acl_association" "public" {
  count          = length(var.public_subnet_ids)
  network_acl_id = aws_network_acl.public.id
  subnet_id      = var.public_subnet_ids[count.index]
}

# Associate Private NACL with Private Subnets
resource "aws_network_acl_association" "private" {
  count          = length(var.private_subnet_ids)
  network_acl_id = aws_network_acl.private.id
  subnet_id      = var.private_subnet_ids[count.index]
}

# Public NACL Rules (Allow All Traffic)
resource "aws_network_acl_rule" "public_ingress" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  protocol       = "-1"
  rule_action    = "allow"
  egress         = false
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "public_egress" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 200
  protocol       = "-1"
  rule_action    = "allow"
  egress         = true
  cidr_block     = "0.0.0.0/0"
}

# Private NACL Rules (Allow All Traffic)
resource "aws_network_acl_rule" "private_ingress" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  protocol       = "-1"
  rule_action    = "allow"
  egress         = false
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_egress" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 200
  protocol       = "-1"
  rule_action    = "allow"
  egress         = true
  cidr_block     = "0.0.0.0/0"
}

