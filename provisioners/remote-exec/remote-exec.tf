
resource "aws_instance" "project_server_1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  # vpc_ids = "aws_vpc.my-first-vpc"
  vpc_security_group_ids = [aws_security_group.project_server_1_sg.id]
  user_data              = data.template_file.user_data.rendered
  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.public_ip
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${self.private_ip} >> /home/ubuntu/private_ips.txt"
    ]
  }

   instance_type = "t2.micro"

  # Using variables
    instance_type = var.instance_type

  tags = {
    Name = "project_server_1"

    # Local
      Name = "project_server_1-${local.project_name}"
  }
} 
