variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
}

variable "local_dev_keypair" {
  type        = string
  description = "Local dev keypair"
}