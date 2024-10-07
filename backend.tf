terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-202410"
    key            = "app/terraform"
    region         = "ap-southeast-2"
    dynamodb_table = "my-terraform-state-lock-table-202410"
    encrypt        = true
  }
}
