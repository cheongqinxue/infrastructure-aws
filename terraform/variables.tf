# Root module (variables.tf)

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-1" # Optional default value
}

variable "github_username" {
  type        = string
  description = "Your GitHub username"
}

variable "github_token" {
  type        = string
  description = "Your GitHub token"
}
