resource "null_resource" "status" {
  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.project_server_1.id}"
  }
  depends_on = [
    aws_instance.project_server_1
  ]
}
