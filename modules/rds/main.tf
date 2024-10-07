resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier          = "${var.app_name}-rds-cluster-${var.environment}"
  engine                      = "aurora-postgresql"
  engine_mode                 = "provisioned"
  engine_version              = "15.4"
  database_name               = var.db_name
  master_username             = var.db_user
  manage_master_user_password = true
  storage_encrypted           = true
  db_subnet_group_name        = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids      = [var.rds_cluster_sg_id]

  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 1
  }

  apply_immediately       = true
  backup_retention_period = 7
  deletion_protection     = false

  skip_final_snapshot          = false
  final_snapshot_identifier    = "${var.app_name}-rds-cluster-snapshot-${var.environment}"
  preferred_maintenance_window = "Sat:14:00-Sat:15:00"
  preferred_backup_window      = "16:00-18:00"
}

resource "aws_rds_cluster_instance" "rds_cluster_instance_1" {
  identifier              = "${var.app_name}-rds-cluster-instance-1-${var.environment}"
  cluster_identifier      = aws_rds_cluster.rds_cluster.id
  instance_class          = "db.serverless"
  engine                  = aws_rds_cluster.rds_cluster.engine
  engine_version          = aws_rds_cluster.rds_cluster.engine_version
  publicly_accessible     = false
  db_subnet_group_name    = aws_rds_cluster.rds_cluster.db_subnet_group_name
  apply_immediately       = true
  preferred_backup_window = aws_rds_cluster.rds_cluster.preferred_backup_window
}

resource "aws_rds_cluster_instance" "rds_cluster_instance_2" {
  identifier           = "${var.app_name}-rds-cluster-instance-2-${var.environment}"
  cluster_identifier   = aws_rds_cluster.rds_cluster.id
  instance_class       = "db.serverless"
  engine               = aws_rds_cluster.rds_cluster.engine
  engine_version       = aws_rds_cluster.rds_cluster.engine_version
  publicly_accessible  = false
  db_subnet_group_name = aws_rds_cluster.rds_cluster.db_subnet_group_name
  apply_immediately    = true
  promotion_tier = 1
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.app_name}-rds-subnet-group-${var.environment}"
  description = "Subnet group for the RDS cluster"
  subnet_ids  = var.subnet_ids
}
