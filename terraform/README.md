# main

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.67.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kit"></a> [kit](#module\_kit) | ./modules/kit | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_secrets"></a> [secrets](#module\_secrets) | ./modules/secrets | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy resources in | `string` | `"ap-southeast-1"` | no |
| <a name="input_local_dev_keypair"></a> [local\_dev\_keypair](#input\_local\_dev\_keypair) | Local dev keypair | `string` | n/a | yes |
| <a name="input_openai_key"></a> [openai\_key](#input\_openai\_key) | OpenAI API key | `string` | n/a | yes |
| <a name="input_qdrant_key"></a> [qdrant\_key](#input\_qdrant\_key) | Qdrant API key | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
