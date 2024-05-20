variable "instance_type" {
  type = string
  description = "The size of the instance."
  #sensitive = true
  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^t2.", var.instance_type))
    error_message = "The instance must be a t2 type ec2 instnace."
  }
}
