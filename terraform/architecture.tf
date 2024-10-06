module "vpc" {
  source = "./modules/vpc"
}

module "kit" {
  source = "./modules/kit"

  subnet_id         = module.vpc.subnet_1_id
  local_dev_keypair = var.local_dev_keypair
}
