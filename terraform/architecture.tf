module "kit" {
  source = "./modules/kit" # Path to the kit sub-module

  # Pass the region and other variables
  region = var.region
}
