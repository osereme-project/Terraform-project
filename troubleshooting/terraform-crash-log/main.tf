terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "project-server-s3"
}


resource "aws_instance" "my_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
	tags = {
		Name = "Myserver"
	}
}

output "public_ip" {
  value = aws_instance.my_server[*].public_ip
}
