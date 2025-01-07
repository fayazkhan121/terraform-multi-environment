region           = "us-east-1"
environment_name = "dev"

vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
azs            = ["us-east-1a", "us-east-1b"]

enable_nat_gateways = true
nat_eip_count       = 1

ami_id        = "ami-0123456789abcdef0"
instance_type = "t3.micro"
assign_public_ip = false
key_name       = "my-dev-key"

bucket_prefix = "my-app-data"
