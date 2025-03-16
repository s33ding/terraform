module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "sg" {
  source    = "./modules/sg"
  vpc_id    = module.vpc.vpc_id
}

module "rt" {
  source             = "./modules/rt"
  vpc_id             = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  create_nat_gateway = var.create_nat_gateway
  nat_gateway_id     = module.vpc.nat_gateway_id
}

module "secrets" {
  source               = "./modules/secrets"
  rds_secret_name      = var.rds_secret_name
  redshift_secret_name = var.redshift_secret_name
}

module "nacl" {
  source            = "./modules/nacl"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id  # <-- Fix: Pass VPC ID
  rds_sg_id          = module.sg.rds_sg_id
  public_subnet_ids = module.vpc.public_subnet_ids
  db_name            = module.secrets.rds_db_name
  username           = module.secrets.rds_username
  password           = module.secrets.rds_password
  rds_name           = var.rds_name  # <-- Fix: Ensure this is defined
}

module "ssm" {
  source             = "./modules/ssm"
  rds_endpoint       = module.rds.rds_endpoint  # Pass RDS endpoint dynamically
  rds_parameter_name = var.rds_parameter_name 
}

module "redshift" {
  source             = "./modules/redshift"
  vpc_id             = module.vpc.vpc_id
  redshift_sg_id     = module.sg.redshift_sg_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  db_name            = module.secrets.redshift_db_name
  username           = module.secrets.redshift_username
  password           = module.secrets.redshift_password
  redshift_cluster_id = var.redshift_cluster_id
  redshift_node_type  = var.redshift_node_type
  redshift_cluster_type = var.redshift_cluster_type
  redshift_number_of_nodes = var.redshift_number_of_nodes
}

