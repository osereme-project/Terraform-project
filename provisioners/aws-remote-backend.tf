# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Devs-Project"

    workspaces {
      name = "Day-0"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
}


