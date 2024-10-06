# Root module (variables.tf)
variable "qdrant_key" {
  type        = string
  description = "Qdrant API key"
  sensitive   = true
}

variable "openai_key" {
  type        = string
  description = "OpenAI API key"
  sensitive   = true
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-1" # Optional default value
}

variable "local_dev_keypair" {
  type        = string
  description = "Local dev keypair"
}
