####################################################################################################
# Qdrant API Key
####################################################################################################

resource "aws_secretsmanager_secret" "qdrant_key" { #tfsec:ignore:aws-ssm-secret-use-customer-key
  name        = "qdrant-key"
  description = "API Key for Qdrant"
}

resource "aws_secretsmanager_secret_version" "qdrant_key_version" {
  secret_id     = aws_secretsmanager_secret.qdrant_key.id
  secret_string = var.qdrant_key
}

####################################################################################################
# Open AI API Key
####################################################################################################

resource "aws_secretsmanager_secret" "openai_key" { #tfsec:ignore:aws-ssm-secret-use-customer-key
  name        = "openai-key"
  description = "API Key for Open AI"
}

resource "aws_secretsmanager_secret_version" "openai_key_version" {
  secret_id     = aws_secretsmanager_secret.openai_key.id
  secret_string = var.openai_key
}