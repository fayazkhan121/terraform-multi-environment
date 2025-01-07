region           = "us-west-2"
environment_name = "prod"

vpc_cidr       = "172.16.0.0/16"
public_subnets = ["172.16.1.0/24", "172.16.2.0/24"]
private_subnets = ["172.16.11.0/24", "172.16.12.0/24"]
azs            = ["us-west-2a", "us-west-2b"]

enable_nat_gateways = true
nat_eip_count       = 2   # Maybe create 2 NAT GWs for redundancy

ami_id        = "ami-0a1b2c3d4e5f67890"  # Example prod AMI
instance_type = "t3.medium"
assign_public_ip = false
key_name       = "my-prod-key"

bucket_prefix  = "my-app-data-prod"
