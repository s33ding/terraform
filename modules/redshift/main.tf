resource "aws_redshift_cluster" "this" {
  cluster_identifier   = var.redshift_cluster_id
  database_name        = var.db_name
  master_username      = var.username
  master_password      = var.password
  node_type            = var.redshift_node_type
  cluster_type         = var.redshift_cluster_type
  number_of_nodes      = var.redshift_number_of_nodes
  publicly_accessible  = true

  vpc_security_group_ids    = [var.redshift_sg_id]
  cluster_subnet_group_name = aws_redshift_subnet_group.this.name
  # skip_final_snapshot = true

}

resource "aws_redshift_subnet_group" "this" {
  name       = "redshift-subnet-group"
  subnet_ids = var.public_subnet_ids
  description = "Subnet group for Redshift"
}

