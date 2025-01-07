variable "environment_name" {
  type        = string
  description = "Name of the environment (dev, staging, prod)."
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
  description = "List of availability zones to use."
}

variable "enable_nat_gateways" {
  type        = bool
  description = "Whether to create NAT Gateways for private subnets."
  default     = true
}

variable "nat_eip_count" {
  type        = number
  default     = 1
  description = "Number of NAT Gateways (usually 1 or match number of AZs)."
}
