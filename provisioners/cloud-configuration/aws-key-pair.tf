resource "aws_key_pair" "deployer" {
  key_name   = "name of your key"
  public_key = "ssh key"
}