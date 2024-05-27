terraform {
}

provider "aws" {
  region = "us-east-1"
}

module "apache" {
  source                 = ".//aws_demo_apache"
  vpc_id                 = "vpc-0f212443905033eff"
  my_ip_with_cidr_blocks = "MY_IP_ADDR/32"
  public_key             = "ssh-rsa AAAA"
  instance_type          = "t3.micro"
  server_name            = "Project server"
}
