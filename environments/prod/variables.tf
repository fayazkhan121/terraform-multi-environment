variable "region" {
  type        = string
  description = "AWS region for production"
}

variable "environment_name" {
  type        = string
  description = "Environment name (e.g., prod)."
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
  description = "List of availability zones."
}

variable "enable_nat_gateways" {
  type    = bool
  default = true
}

variable "nat_eip_count" {
  type    = number
  default = 2
  # Possibly you want multiple NAT GWs in production
}

variable "ami_id" {
  type        = string
  description = "AMI for production environment"
}

variable "instance_type" {
  type        = string
  default     = "t3.medium"
  description = "Instance type for production"
}

variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "key_name" {
  type    = string
  default = ""
}

variable "bucket_prefix" {
  type    = string
  default = "my-app-data-prod"
}
