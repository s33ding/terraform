variable "rds_secret_name" {
  description = "Name of the AWS Secrets Manager secret for RDS"
  type        = string
}

variable "redshift_secret_name" {
  description = "Name of the AWS Secrets Manager secret for Redshift"
  type        = string
}

