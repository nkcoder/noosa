resource "aws_ecr_repository" "my_app_repo" {
  name = var.ecr_name

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"
}

