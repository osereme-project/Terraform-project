terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
}


resource "aws_instance" "project_server" {
  for_each = {
    nano = "t2.nano"
    micro = "t2.micro"
    small = "t2.small"
  }
  ami           = "ami-04b70fa74e45c3917"
  instance_type = each.value

  tags = {
    Name = "Server-${each.key}"
  }
}

output "public_ip" {
  value = values(aws_instance.project_server)[*].public_ip
}
