variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "MyVPC"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway for private subnets"
  type        = bool
  default     = false
}


variable "rds_secret_name" {
  description = "The name of the AWS Secrets Manager secret for RDS"
  type        = string
}

variable "rds_name" {
  description = "The name of the RDS instance"
  type        = string
}

variable "redshift_secret_name" {
  description = "The name of the AWS Secrets Manager secret for Redshift"
  type        = string
}


variable "rds_parameter_name" {
  description = "RDS parameter"
  type        = string
}

variable "redshift_cluster_id" {
  description = "Redshift cluster identifier"
  type        = string
}

variable "redshift_node_type" {
  description = "Redshift node type"
  type        = string
}

variable "redshift_cluster_type" {
  description = "Redshift cluster type (single-node or multi-node)"
  type        = string
}

variable "redshift_number_of_nodes" {
  description = "Number of nodes in the Redshift cluster"
  type        = number
}

variable "redshift_parameter_name" {
  description = "Redshift parameter name"
  type        = string
}

