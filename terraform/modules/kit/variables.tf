variable "kit_public_key" {
  type        = string
  description = "SSH Public Key for EC2 Access"
}

variable "local_dev_keypair" {
  type = string
  description = "Local dev keypair"
}