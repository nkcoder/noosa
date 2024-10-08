environment = "dev"
aws_region  = "ap-southeast-2"
app_name    = "backend-app"

# ecr
ecr_name = "backend-app-ecr-repo"

# vpc
app_port = 3000

# rds
rds_db_name = "app_db"
rds_db_user = "app_user"

# alb
alb_app_port                         = 80
alb_health_check_interval            = 30
alb_health_check_timeout             = 10
alb_health_check_healthy_threshold   = 3
alb_health_check_unhealthy_threshold = 2
alb_tg_min_healthy_targets           = 1

# ecs
ecs_image_tag        = "v1"
ecs_task_cpu         = 256
ecs_task_memory      = 512
ecs_container_cpu    = 256
ecs_container_memory = 512
ecs_desired_count    = 2
