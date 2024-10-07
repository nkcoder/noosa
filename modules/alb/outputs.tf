output "alb_target_group_arn" {
  value = aws_lb_target_group.app_alb_target_group.arn
  description = "The ARN of the ALB target group"
}