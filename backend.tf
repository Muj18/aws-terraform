# backend configuration
terraform {
  backend "s3" {
    bucket         = "projectmujib"
    encrypt        = true
    key            = "path/to/my/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "projectmujib"
  }
}