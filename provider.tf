provider "aws" {}

terraform {
  backend "s3" {
    bucket = "mysrikanth"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}