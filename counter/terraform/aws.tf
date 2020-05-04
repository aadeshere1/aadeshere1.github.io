# https://www.terraform.io/docs/configuration/terraform.html
terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = "~> 2.0"
  }

  backend "s3" {
    bucket  = "aadeshere1.github.io-backend"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "personal"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "personal"
}