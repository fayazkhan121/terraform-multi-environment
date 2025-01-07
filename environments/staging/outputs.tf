# VPC
output "staging_vpc_id" {
  value = module.network.vpc_id
}

output "staging_public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "staging_private_subnet_ids" {
  value = module.network.private_subnet_ids
}

# EC2
output "staging_ec2_instance_id" {
  value = module.compute.instance_id
}

output "staging_ec2_private_ip" {
  value = module.compute.private_ip
}

# ALB
output "staging_alb_dns_name" {
  value = module.alb.alb_dns_name
}

# S3
output "staging_bucket_name" {
  value = module.data.bucket_name
}
