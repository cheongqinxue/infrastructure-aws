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

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | Your GitHub token | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | Your GitHub username | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy resources in | `string` | `"ap-southeast-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
