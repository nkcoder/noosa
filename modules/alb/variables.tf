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
  default     = 3000
}

variable "alb_sg_id" {
  description = "Security Group for the ALB"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}
