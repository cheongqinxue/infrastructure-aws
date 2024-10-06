module "vpc" {
  source = "./modules/vpc"
}

module "kit" {
  source = "./modules/kit"

  vpc_id            = module.vpc.vpc_1_id
  subnet_id         = module.vpc.subnet_1_id
  local_dev_keypair = var.local_dev_keypair
}
