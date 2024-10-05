# Root module (variables.tf)

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-1" # Optional default value
}

variable "local_dev_keypair" {
  type = string
  description = "Local dev keypair"
}

variable "AWS_ACCESS_KEY_ID" {
  type = string
  description = "AWS_ACCESS_KEY_ID"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  description = "AWS_SECRET_ACCESS_KEY"
}