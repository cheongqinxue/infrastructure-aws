output "openai_key_arn" {
  value       = aws_secretsmanager_secret.openai_key.arn
  description = "ARN of the OpenAI API key"
}

output "qdrant_key_arn" {
  value       = aws_secretsmanager_secret.qdrant_key.arn
  description = "ARN of the Qdrant API key"
}