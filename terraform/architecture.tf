module "kit" {
  source = "./modules/kit"

  aws_region = var.aws_region
  local_dev_keypair = var.local_dev_keypair
}
