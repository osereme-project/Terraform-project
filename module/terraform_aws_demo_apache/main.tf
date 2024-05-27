provider "aws" {
  # Configuration options
  profile = "default"
  region  = "us-east-1"
  alias   = "east"
}


data "aws_vpc" "main" {
  id = var.vpc_id
}


resource "aws_security_group" "project_server_sg" {
  name        = "project_server_sg"
  description = "project_server security group"
  vpc_id      = data.aws_vpc.main.id

  ingress = [
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.my_ip_with_cidr_blocks]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "outgoing traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

data "template_file" "user_data" {
  template = file("${path.module}/userdata.yaml")
}


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

resource "aws_instance" "project_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.project_server_sg.id]
  user_data              = data.template_file.user_data.rendered
  provisioner "file" {
    content     = "mars"
    destination = "/home/ubuntu/barsoon.txt"
  }

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.public_ip
    private_key = file("~/.ssh/id_rsa")
  }


  tags = {
    Name = var.server_name
  }
}
