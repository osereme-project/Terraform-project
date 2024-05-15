resource "aws_security_group" "project_server_1_sg" {
  name        = "project_server_1_sg"
  description = "project_server_1 security group"
  vpc_id      = data.aws_vpc.virtual-network.id

  ingress = [
    {
      description = "HTTP"
      from_port   = 80
      ip_protocol = "tcp"
      to_port     = 80
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
      ipv6_cidr_blocks   = []
      prefix_list_ids = [  ]
      security_groups = [  ]
      self = false

    },
    {
      description = "SSH"
      from_port   = 22
      ip_protocol = "tcp"
      to_port     = 22
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
      ipv6_cidr_blocks   = []
      prefix_list_ids = [  ]
      security_groups = [  ]
      self = false

    }
  ]
  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

