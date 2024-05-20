/* 
output "public_ip" {
  value = aws_instance.project_server_1.public_ip
}
 */


output "private_ip_addr" {
  value       = aws_instance.project_server_1.private_ip
  description = "The private IP address of the main server instance."
  sensitive = true
}