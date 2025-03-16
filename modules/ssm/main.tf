resource "aws_ssm_parameter" "rds_endpoint" {
  name        = var.rds_parameter_name  # <-- Use `rds_parameter_name`
  description = "RDS Endpoint for the application"
  type        = "String"
  value       = var.rds_endpoint
  overwrite   = true

  tags = {
    Name = "RDS Endpoint Parameter"
  }
}

