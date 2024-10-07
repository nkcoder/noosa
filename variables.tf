# common variables for all modules
variable "environment" {
  description = "The environment in which the infrastructure is deployed"
  type        = string
}
variable "aws_region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
}
variable "app_name" {
  description = "The name of the application"
  type        = string
}

# variables for the vpc module
variable "app_port" {
  description = "The port on which the application listens"
  type        = number
}

# variables for the ecr module
variable "ecr_name" {
  description = "The name of the ECR repository"
  type        = string
}

# variables for the rds module
variable "rds_db_name" {
  description = "The name of the RDS database"
  type        = string
}
variable "rds_db_user" {
  description = "The username for the RDS database"
  type        = string
}
variable "rds_db_password" {
  description = "The password for the RDS database"
  type        = string
}

# variables for the alb module
variable "alb_app_port" {
  description = "The port on which the application listens"
  type        = number
}

# variables for the ecs module
variable "ecs_image_tag" {
  description = "The tag of the Docker image"
  type        = string
}
variable "ecs_task_cpu" {
  description = "The CPU units for the ECS task"
  type        = number
}
variable "ecs_task_memory" {
  description = "The memory for the ECS task"
  type        = number
}
variable "ecs_container_cpu" {
  description = "The CPU units for the container"
  type        = number
}
variable "ecs_container_memory" {
  description = "The memory for the container"
  type        = number
}
variable "ecs_desired_count" {
  description = "The desired count for the ECS service"
  type        = number
}
variable "ecs_container_name" {
  description = "The name of the container"
  type        = string
}











