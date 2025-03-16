# RDS Outputs
output "rds_db_name" {
  value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_value.secret_string)["db_name"]
}

output "rds_username" {
  value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_value.secret_string)["username"]
}

output "rds_password" {
  value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]
  sensitive = true
}

# Redshift Outputs
output "redshift_db_name" {
  value = jsondecode(data.aws_secretsmanager_secret_version.redshift_secret_value.secret_string)["db_name"]
}

output "redshift_username" {
  value = jsondecode(data.aws_secretsmanager_secret_version.redshift_secret_value.secret_string)["username"]
}

output "redshift_password" {
  value = jsondecode(data.aws_secretsmanager_secret_version.redshift_secret_value.secret_string)["password"]
  sensitive = true
}

