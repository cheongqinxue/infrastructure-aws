module "secrets" {
  source = "./modules/secrets"

  openai_key = var.openai_key
  qdrant_key = var.qdrant_key
}

module "networking" {
  source = "./modules/networking"
}

module "kit" {
  source = "./modules/kit"

  openai_key_arn    = module.secrets.openai_key_arn
  qdrant_key_arn    = module.secrets.qdrant_key_arn
  vpc_id            = module.networking.vpc_1_id
  subnet_id         = module.networking.subnet_1_id
  local_dev_keypair = var.local_dev_keypair
}
