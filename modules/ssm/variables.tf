variable "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  type        = string
}

variable "rds_parameter_name" {  # <-- Corrected variable name
  description = "The name of the SSM Parameter where the RDS endpoint is stored"
  type        = string
}


