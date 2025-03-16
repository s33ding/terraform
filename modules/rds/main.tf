# Create an RDS Subnet Group
resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.public_subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

# Deploy RDS PostgreSQL Instance
resource "aws_db_instance" "rds" {
  identifier             = var.rds_name
  allocated_storage       = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username              = var.username
  password              = var.password
  publicly_accessible    = true
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  skip_final_snapshot    = true

  tags = {
    Name = "RDS Instance"
  }
}

