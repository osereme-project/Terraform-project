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


resource "aws_instance" "project_server_1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    Name = "project_server_1"
  }
}


resource "aws_s3_bucket" "buckets" {
  bucket = "2482094298-depends-on"
  depends_on = [ aws_instance.project_server_1 ]
}


output "public_ip" {
  value = aws_instance.project_server_1.public_ip
}
