output "ecs_servcie_sg_id" {
  value       = aws_security_group.ecs_service_sg.id
  description = "The ID of the ECS service security group"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "The ID of the RDS security group"
}

output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "The ID of the ALB security group"
}

output "public_subnet_ids" {
  value       = data.aws_subnets.default.ids
  description = "The IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = [aws_subnet.private_subnet_2a.id, aws_subnet.private_subnet_2b.id, aws_subnet.private_subnet_2c.id]
  description = "The IDs of the private subnets"
}

output "vpc_id" {
  value       = data.aws_vpc.default.id
  description = "The ID of the VPC"
}

output "ecs_app_port" {
  value       = var.app_port
  description = "The port where the ECS application will be listening"
}
