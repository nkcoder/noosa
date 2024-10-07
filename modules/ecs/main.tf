resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.app_name}-ecs-cluster-${var.environment}"
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.app_name}-ecs-task-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name      = var.container_name
    image     = "${var.ecr_url}:${var.image_tag}"
    cpu       = var.container_cpu
    memory    = var.container_memory
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
    environment = [
      {
        name  = "NODE_ENV"
        value = var.environment
      },
      {
        name  = "LOG_LEVEL"
        value = var.log_level
      },
      {
        name  = "DB_HOST"
        value = var.db_host
      },
      {
        name  = "DB_NAME"
        value = var.db_name
      },
      {
        name  = "DB_PASSWORD"
        value = var.db_password
      }
    ]
  }])
}

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.app_name}-ecs-service-${var.environment}"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = true
    security_groups  = [var.ecs_service_sg_id]
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  depends_on = [
    aws_iam_role_policy_attachment.ecs_task_execution_role_policy,
    aws_iam_role_policy.ecs_task_role_policy,
    var.rds_cluster_arn
  ]
}


