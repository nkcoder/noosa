environment = "dev"
aws_region  = "ap-southeast-2"

# ecr
ecr_name = "app-ecs-repo"

# vpc
app_port    = 3000

# rds
rds_db_name     = "app_postgres_db"
rds_db_user     = "app_user"
rds_db_password = "app_yrZ6H9HUWmczCV_bTAHe"

# alb
alb_app_port = 80

# ecs
ecs_image_tag        = "v1"
ecs_task_cpu         = 256
ecs_task_memory      = 512
ecs_container_cpu    = 256
ecs_container_memory = 512
ecs_desired_count    = 2
ecs_container_name   = "app-container"
