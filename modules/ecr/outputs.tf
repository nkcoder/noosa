output "app_ecr_url" {
  value       = aws_ecr_repository.my_app_repo.repository_url
  description = "The URL of the ECR repository"
}
