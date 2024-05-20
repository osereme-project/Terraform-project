terraform {
}

module "data_source_aws_server" {
  source        = ".//data_source_aws_server"
  instance_type = "t2.micro"
}

output "private_ip_addr" {
  value       = module.data_source_aws_server.private_ip_addr
  description = "The private IP address of the main server instance."
  sensitive   = true
}