variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "rds_name" {
  description = "The name of the RDS instance"
  type        = string
}

variable "rds_sg_id" {
  description = "Security Group ID for RDS"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of private subnet IDs where RDS will be deployed"
  type        = list(string)
}

variable "db_name" {
  description = "Database name from AWS Secrets Manager"
  type        = string
}

variable "username" {
  description = "Database username from AWS Secrets Manager"
  type        = string
}

variable "password" {
  description = "Database password from AWS Secrets Manager"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Storage size for the RDS instance"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "17"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

