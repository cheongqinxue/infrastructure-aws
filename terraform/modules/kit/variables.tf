variable "region" {
  description = "The AWS region for the EC2 instance"
  type        = string
}

variable "kit_public_key" {
  type        = string
  description = "SSH Public Key for EC2 Access"
}
