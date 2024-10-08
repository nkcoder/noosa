environment = "prod"
aws_region  = "ap-southeast-2"
app_name    = "backend-app"

# ecr
ecr_name = "backend-app-ecr-repo"

# vpc
app_port = 3000

# rds
rds_db_name                 = "app_db"
rds_db_user                 = "app_user"
rds_scaling_min_capacity    = 1
rds_scaling_max_capacity    = 2
rds_deletion_protection     = true
rds_backup_retention_period = 30

# alb
alb_app_port                         = 80
alb_health_check_interval            = 30
alb_health_check_timeout             = 5
alb_health_check_healthy_threshold   = 3
alb_health_check_unhealthy_threshold = 2
alb_tg_min_healthy_targets           = 2

# ecs
ecs_image_tag        = "v1"
ecs_task_cpu         = 1024
ecs_task_memory      = 1024
ecs_container_cpu    = 1024
ecs_container_memory = 1024
ecs_desired_count    = 3
