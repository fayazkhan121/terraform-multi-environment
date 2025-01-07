variable "region" {
  type        = string
  description = "AWS region to deploy into"
}

variable "environment_name" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs."
}

variable "azs" {
  type        = list(string)
  description = "Availability zones."
}

variable "enable_nat_gateways" {
  type        = bool
  default     = true
}

variable "nat_eip_count" {
  type        = number
  default     = 1
}

variable "ami_id" {
  type        = string
  description = "AMI for the staging environment."
}

variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "Instance type for staging."
}

variable "assign_public_ip" {
  type        = bool
  default     = false
}

variable "key_name" {
  type        = string
  default     = ""
}

variable "bucket_prefix" {
  type        = string
  default     = "my-app-data"
}
