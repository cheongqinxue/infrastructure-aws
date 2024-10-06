# Root module (variables.tf)

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-1" # Optional default value
}

variable "local_dev_keypair" {
  type        = string
  description = "Local dev keypair"
}