variable "vpc_id" {
  description = "VPC ID where Redshift will be deployed"
  type        = string
}

variable "redshift_sg_id" {
  description = "Security Group ID for Redshift"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for Redshift"
  type        = list(string)
}

variable "db_name" {
  description = "Database name for Redshift"
  type        = string
}

variable "username" {
  description = "Master username for Redshift"
  type        = string
}

variable "password" {
  description = "Master password for Redshift"
  type        = string
  sensitive   = true
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

