variable "vpc_id" {
  type = string
  default = "vpc-0e9f0f30a0a64e0ca"
}

variable "my_ip_with_cidr_blocks" {
  type        = string
  description = "Provide your IP eg. 99.231.231.156/32"
}

variable "public_key" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "server_name" {
  type    = string
  default = "Project Server"
}