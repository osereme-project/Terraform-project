terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
}

# Data source for aws instances
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "project_server_1" {
  ami = local.ami
  instance_type = local.instance_type
  #ami           = "ami-04b70fa74e45c3917"
  #instance_type = "t2.micro"
 
# Using variables
  #instance_type = var.instance_type

  #instance_type= "t2.micro"

  tags = {
   Name = "project_server_1"

# Local
  #Name = "project_server_1-${local.project_name}"
  }
}

locals {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = var.instance_type

}

variable "instance_type" {
  type = string
  description = "The size of the instance."
  #sensitive = true
  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^t2.", var.instance_type))
    error_message = "The instance must be a t2 type ec2 instnace."
  }
}


/* 
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
 */

output "private_ip_addr" {
  value       = aws_instance.project_server_1.private_ip
  description = "The private IP address of the main server instance."
  sensitive = true
}

