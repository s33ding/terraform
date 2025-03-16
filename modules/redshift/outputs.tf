output "redshift_endpoint" {
  description = "Redshift cluster endpoint"
  value       = aws_redshift_cluster.this.endpoint
}

output "redshift_id" {
  description = "Redshift cluster identifier"
  value       = aws_redshift_cluster.this.id
}

