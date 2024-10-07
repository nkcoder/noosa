output "db_name" {
  value       = aws_rds_cluster.rds_cluster.database_name
  description = "The name of the RDS database"
}

output "db_user" {
  value       = aws_rds_cluster.rds_cluster.master_username
  description = "The username of the RDS database"
}

output "db_password" {
  value       = aws_rds_cluster.rds_cluster.master_password
  description = "The password of the RDS database"
}

output "db_host" {
  value       = aws_rds_cluster.rds_cluster.endpoint
  description = "The host of the RDS database"
}

output "rds_cluster_arn" {
  value       = aws_rds_cluster.rds_cluster.arn
  description = "The ARN of the RDS cluster"
}