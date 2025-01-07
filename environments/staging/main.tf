################################################
# 1) Network Module
################################################
module "network" {
  source = "../../modules/network"

  environment_name    = var.environment_name
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  azs                 = var.azs
  enable_nat_gateways = var.enable_nat_gateways
  nat_eip_count       = var.nat_eip_count
}

################################################
# 2) Compute Module
################################################
module "compute" {
  source = "../../modules/compute"

  environment_name  = var.environment_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = element(module.network.private_subnet_ids, 0)
  security_group_ids = [
    module.network.ssh_sg_id
  ]
  assign_public_ip    = var.assign_public_ip
  key_name            = var.key_name
  enable_ebs_optimized = false
}

################################################
# 3) Load Balancer Module
################################################
module "alb" {
  source = "../../modules/loadbalancer"

  environment_name    = var.environment_name
  subnet_ids          = module.network.public_subnet_ids
  security_group_ids  = [ module.network.lb_sg_id ]
  target_instance_ids = [ module.compute.instance_id ]
}

################################################
# 4) Data (S3) Module
################################################
module "data" {
  source = "../../modules/data"

  environment_name = var.environment_name
  bucket_prefix    = var.bucket_prefix
}
