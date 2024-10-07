resource "aws_lb" "app_alb" {
  name                       = "${var.app_name}-alb-${var.environment}"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.alb_sg_id]
  subnets                    = var.subnet_ids
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app_alb_target_group" {
  name     = "${var.app_name}-alb-tg-${var.environment}"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  target_type = "ip"
}

resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_alb_target_group.arn
  }
}
