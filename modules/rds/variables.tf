variable "environment" {
  description = "The environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC where the resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where the resources will be created"
  type        = list(string)
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_user" {
  description = "The username for the database"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the database"
  type        = string
  default     = "db.serverless"
}

variable "ecs_service_sg_id" {
  description = "The security group ID for the ECS service to allow database connections"
  type        = string
}

variable "rds_cluster_sg_id" {
  description = "The security group ID for the RDS cluster"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
  type        = string
}