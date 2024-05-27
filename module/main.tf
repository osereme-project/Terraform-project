terraform {
}

provider "aws" {
  region = "us-east-1"
}

module "apache" {
  source                 = ".//aws_demo_apache"
  vpc_id                 = "vpc-0f212443905033eff"
  my_ip_with_cidr_blocks = "99.231.231.156/32"
  public_key             = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsCsgY7QgYFAyKzbAE0JVydSJNojiUnx9x3dVtDEP8Wx17Q2uVmE9xMmtKn1nW5OQK1KNHMeG/BADlcrF7GCfr8ptg4PwG235WDJT9VzFz8+x3tQpMzraN0QlIRjiPMjDU/cSicE7TVzaA64tBKXk6onDJMUSMt5vaDrK8Fyxny1QCJxB/eJ5KNWuljMwdgTR6+aILGnQ7qx0c4yDZYoqJZ0a0P2uQxl4xyWy5Mbo7saPOYy+8AD+rBofgmmQKjTPc9XBPoSYxXJfvJNOcXJT7sWVx4KW4f46/utW9ShWdtHTSsHZiTZwIDfZU2wxJl9QfjgsXbGcOLIp0quwB4W2HNv8QCaWg1YCnAB8sJb4qljeCNGzH0M/D6gHTxnuv3q4mBVDl7XkQoJ+hVkd7FSXiFRNYu3jYxFpLpbuOUcLlTSE0Pw5/jvDa5fjuz2VrfRyzcszfkiS3OTLfJ8fjZOoRIY14/pF7yA5ZrA2pNl0GJ4MPCBUjSrR8ymNyOpCnq4U= akins@Victoria"
  instance_type          = "t3.micro"
  server_name            = "Project server"
}