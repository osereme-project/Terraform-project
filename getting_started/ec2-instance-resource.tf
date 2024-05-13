resource "aws_instance" "project_server_1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
 
# Using variables
#  instance_type = var.instance_type


# Local
#  Name = "project_server_1-${local.project_name}"

# instance_type = "t2.micro"
 
# Using variables
#  instance_type = var.instance_type

  tags = {
   Name = "project_server_1"

# Local
#  Name = "project_server_1-${local.project_name}"
  }
}