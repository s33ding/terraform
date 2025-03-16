output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "redshift_sg_id" {
  value = aws_security_group.redshift_sg.id
}

