terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = "POC"
      Owner       = "Igor"
    }
  }
}
