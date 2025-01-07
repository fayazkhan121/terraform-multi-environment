variable "environment_name" {
  type        = string
  description = "Environment name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for the LB (usually public subnets)"
}

variable "security_group_ids" {
  type        = list(string)
  description = "SG(s) for the LB"
}

variable "target_instance_ids" {
  type        = list(string)
  description = "IDs of instances to target with the LB"
}
