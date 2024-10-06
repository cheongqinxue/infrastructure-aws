variable "qdrant_key_arn" {
  description = "ARN of the Qdrant API key"
  type        = string
}

variable "openai_key_arn" {
  description = "ARN of the OpenAI API key"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be launched."
  type        = string
}

variable "local_dev_keypair" {
  type        = string
  description = "Local dev keypair"
}