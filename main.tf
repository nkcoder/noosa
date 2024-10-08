provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  required_version = ">= 1.2.0"
}

locals {
  environment = terraform.workspace
}

module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  app_port    = var.app_port
  app_name    = var.app_name
}

module "ecr" {
  source   = "./modules/ecr"
  ecr_name = var.ecr_name
}

module "rds" {
  source = "./modules/rds"

  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.private_subnet_ids
  ecs_service_sg_id = module.vpc.ecs_servcie_sg_id
  rds_cluster_sg_id = module.vpc.rds_sg_id
  db_name           = var.rds_db_name
  db_user           = var.rds_db_user
  app_name          = var.app_name
}

module "alb" {
  source = "./modules/alb"

  environment                      = var.environment
  vpc_id                           = module.vpc.vpc_id
  subnet_ids                       = module.vpc.public_subnet_ids
  alb_sg_id                        = module.vpc.alb_sg_id
  app_port                         = var.alb_app_port
  app_name                         = var.app_name
  health_check_interval            = var.alb_health_check_interval
  health_check_timeout             = var.alb_health_check_timeout
  health_check_healthy_threshold   = var.alb_health_check_healthy_threshold
  health_check_unhealthy_threshold = var.alb_health_check_unhealthy_threshold
  tg_min_healthy_targets           = var.alb_tg_min_healthy_targets
}

module "ecs" {
  source = "./modules/ecs"

  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  ecr_url              = module.ecr.app_ecr_url
  image_tag            = var.ecs_image_tag
  task_cpu             = var.ecs_task_cpu
  task_memory          = var.ecs_task_memory
  container_cpu        = var.ecs_container_cpu
  container_memory     = var.ecs_container_memory
  desired_count        = var.ecs_desired_count
  subnet_ids           = module.vpc.public_subnet_ids
  db_host              = module.rds.db_host
  db_name              = module.rds.db_name
  db_user              = module.rds.db_user
  db_password          = module.rds.db_password
  alb_sg_id            = module.vpc.alb_sg_id
  ecs_service_sg_id    = module.vpc.ecs_servcie_sg_id
  rds_cluster_arn      = module.rds.rds_cluster_arn
  container_name       = var.app_name + "-container-" + var.environment
  container_port       = module.vpc.ecs_app_port
  alb_target_group_arn = module.alb.alb_target_group_arn
  app_name             = var.app_name
}






