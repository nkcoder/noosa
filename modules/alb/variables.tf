variable "vpc_id" {
  description = "VCP where the ALB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where the ALB will be deployed"
  type        = list(string)
}

variable "environment" {
  description = "Environment where the ALB will be deployed"
  type        = string
}

variable "app_port" {
  description = "Port where the application will be listening"
  type        = number
  default     = 80
}

variable "alb_sg_id" {
  description = "Security Group for the ALB"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "health_check_interval" {
  description = "Interval for the health check"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout for the health check"
  type        = number
  default     = 10
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold for the health check"
  type        = number
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for the health check"
  type        = number
  default     = 2
}

variable "tg_min_healthy_targets" {
  description = "Minimum healthy targets for the target group"
  type        = number
  default     = 1
}