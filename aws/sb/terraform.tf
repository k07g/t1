terraform {
  cloud {
    organization = "k07g"
    hostname     = "app.terraform.io"
    workspaces {
      name    = "t1-sb"
      project = "sandbox"
    }
  }
  required_version = ">= 1.14.7"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 6.0"
    }
  }
}