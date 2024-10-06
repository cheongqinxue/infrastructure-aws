# vpc

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.openai_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret.qdrant_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.openai_key_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_secretsmanager_secret_version.qdrant_key_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_openai_key"></a> [openai\_key](#input\_openai\_key) | OpenAI API key | `string` | n/a | yes |
| <a name="input_qdrant_key"></a> [qdrant\_key](#input\_qdrant\_key) | Qdrant API key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_openai_key_arn"></a> [openai\_key\_arn](#output\_openai\_key\_arn) | ARN of the OpenAI API key |
| <a name="output_qdrant_key_arn"></a> [qdrant\_key\_arn](#output\_qdrant\_key\_arn) | ARN of the Qdrant API key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
