variable "region" {
  type        = string
  description = "AWS region to deploy into"
}

variable "environment_name" {
  type        = string
  description = "Environment name (dev, staging, prod)."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets"
}

variable "azs" {
  type        = list(string)
  description = "AZs for dev environment"
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
  description = "AMI for dev environment"
}

variable "instance_type" {
  type        = string
  description = "Instance type for dev"
  default     = "t3.micro"
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
