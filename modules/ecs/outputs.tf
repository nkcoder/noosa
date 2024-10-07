output "app_ecs_service_arn" {
  description = "The ARN of the ECS service"
  value = aws_ecs_service.ecs_service.id
}