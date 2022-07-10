# terraform {
#   backend "s3" {
#     bucket         = "pbl-project-18"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-2"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }