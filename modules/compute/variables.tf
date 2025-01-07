variable "environment_name" {
  type        = string
  description = "Environment name (dev, staging, prod)."
}

variable "ami_id" {
  type        = string
  description = "AMI to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance size"
}

variable "subnet_id" {
  type        = string
  description = "Subnet where the instance will be placed"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach"
}

variable "assign_public_ip" {
  type        = bool
  description = "If true, associate a public IP address to instance"
  default     = false
}

variable "enable_ebs_optimized" {
  type        = bool
  default     = false
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH"
  default     = ""
}
