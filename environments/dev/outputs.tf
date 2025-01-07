# VPC
output "dev_vpc_id" {
  value = module.network.vpc_id
}

# Subnets
output "dev_public_subnet_ids" {
  value = module.network.public_subnet_ids
}
output "dev_private_subnet_ids" {
  value = module.network.private_subnet_ids
}

# EC2
output "dev_ec2_instance_id" {
  value = module.compute.instance_id
}
output "dev_ec2_instance_private_ip" {
  value = module.compute.private_ip
}

# ALB
output "dev_alb_dns_name" {
  value = module.alb.alb_dns_name
}

# S3 bucket
output "dev_bucket_name" {
  value = module.data.bucket_name
}
