variable "environment" {
  description = "The environment in which the ECS service is running"
  type        = string
}

variable "ecr_url" {
  description = "The URL of the ECR repository"
  type        = string
}

variable "image_tag" {
  description = "The tag of the image to deploy"
  type        = string
}

variable "container_cpu" {
  description = "The number of CPU units to reserve for the container"
  type        = number
  default     = 256
}

variable "container_memory" {
  description = "The amount of memory to reserve for the container"
  type        = number
  default     = 512
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_port" {
  description = "The port on which the container listens"
  type        = number
  default     = 3000
}

variable "task_cpu" {
  description = "The number of CPU units to reserve for the task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "The amount of memory to reserve for the task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "The number of tasks to run"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "The IDs of the subnets in which to run the ECS service"
  type        = list(string)
}

variable "db_host" {
  description = "The host of the database"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_user" {
  description = "The username of the database"
  type        = string
}

variable "db_password" {
  description = "The password of the database"
  type        = string
}

variable "log_level" {
  description = "The log level of the application"
  type        = string
  default     = "info"
}

variable "app_port" {
  description = "The port on which the application listens"
  type        = number
  default     = 3000
}

variable "vpc_id" {
  description = "The VPC ID in which to run the ECS service"
  type        = string
}

variable "alb_sg_id" {
  description = "The ID of the security group for the ALB"
  type        = string
}

variable "ecs_service_sg_id" {
  description = "The ID of the security group for the ECS service"
  type        = string
}

variable "rds_cluster_arn" {
  description = "The ARN of the RDS cluster"
  type        = string
}

variable "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
  type        = string
}