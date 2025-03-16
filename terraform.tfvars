vpc_name = "vpc-prod"
rds_name = "rds-prod"

vpc_id = "vpc-05eb439ca7be9c0f6"
vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

availability_zones = ["us-east-1a", "us-east-1b"]

rds_secret_name      = "rds-secret"
redshift_secret_name = "redshift-secret"

rds_parameter_name = "/dataiesb/rds/host"  
redshift_parameter_name = "/dataiesb/redshift/jdbc"  

redshift_cluster_id  = "redshift-prod"
redshift_node_type   = "dc2.large"
redshift_cluster_type = "multi-node"
redshift_number_of_nodes = 1


