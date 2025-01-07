region           = "us-east-2"
environment_name = "staging"

vpc_cidr         = "10.10.0.0/16"
public_subnets   = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets  = ["10.10.11.0/24", "10.10.12.0/24"]
azs              = ["us-east-2a", "us-east-2b"]

enable_nat_gateways = true
nat_eip_count       = 1

ami_id           = "ami-0ab1c2d3e4f567890"   # Example staging AMI
instance_type    = "t3.small"
assign_public_ip = false
key_name         = "my-staging-key"

bucket_prefix = "my-app-data-staging"
