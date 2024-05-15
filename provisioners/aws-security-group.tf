# Don't use this security group
/* resource "aws_security_group" "project_server_1_sg" {
  name        = "project_server_1_sg"
  description = "project_server_1 security group"
  vpc_id      = "" #add your vpc id
}

resource "aws_vpc_security_group_ingress_rule" "SSH" {
  security_group_id = aws_security_group.project_server_1_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "SSH"
}

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
  security_group_id = aws_security_group.project_server_1_sg.id
  cidr_ipv6         = "::/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "HTTP"
}

resource "aws_vpc_security_group_egress_rule" "project_server_1_sg_ipv4" {
  security_group_id = aws_security_group.project_server_1_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "project_server_1_sg_ipv6" {
  security_group_id = aws_security_group.project_server_1_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
} */