# Subnets: public and private
data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }

  # the tag is added manually
  filter {
    name   = "tag:default-for-az"
    values = ["true"]
  }
}

resource "aws_subnet" "private_subnet_2a" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.64.0/24"
  availability_zone = "ap-southeast-2a"
  tags = {
    Name = "private-2a"
  }
}
resource "aws_subnet" "private_subnet_2b" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.65.0/24"
  availability_zone = "ap-southeast-2b"
  tags = {
    Name = "private-2b"
  }
}
resource "aws_subnet" "private_subnet_2c" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.66.0/24"
  availability_zone = "ap-southeast-2c"
  tags = {
    Name = "private-2c"
  }
}

# Security groups
resource "aws_security_group" "alb_sg" {
  name        = "${var.app_name}-alb-sg-${var.environment}"
  description = "Security group for ALB"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP inbound traffic"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS inbound traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-alb-sg-${var.environment}"
  }
}

resource "aws_security_group" "ecs_service_sg" {
  name        = "${var.app_name}-ecs-service-sg-${var.environment}"
  description = "Security group for the ECS service"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "Allow traffic from the ALB"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-ecs-service-sg-${var.environment}"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.app_name}-rds-sg-${var.environment}"
  description = "Security group for the RDS cluster"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "Allow traffic from the ECS service"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_service_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-rds-sg-${var.environment}"
  }
}
