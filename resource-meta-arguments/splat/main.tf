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
  count = 2
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    Name = "Server-${count.index}"
  }
}

output "public_ip" {
  value = aws_instance.project_server[*].public_ip
}
