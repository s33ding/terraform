# Fetch RDS Secret
data "aws_secretsmanager_secret" "rds_secret" {
  name = var.rds_secret_name
}

data "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id = data.aws_secretsmanager_secret.rds_secret.id
}

# Fetch Redshift Secret
data "aws_secretsmanager_secret" "redshift_secret" {
  name = var.redshift_secret_name
}

data "aws_secretsmanager_secret_version" "redshift_secret_value" {
  secret_id = data.aws_secretsmanager_secret.redshift_secret.id
}

