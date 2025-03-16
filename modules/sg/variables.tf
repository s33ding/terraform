variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "allowed_ips" {
  description = "List of CIDR blocks allowed to access RDS"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Update for security
}

