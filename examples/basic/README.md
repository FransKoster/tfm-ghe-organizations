# basic

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.8.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_enterprise_organization"></a> [enterprise\_organization](#module\_enterprise\_organization) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_logins"></a> [admin\_logins](#input\_admin\_logins) | List of GitHub usernames to be organization administrators. | `list(string)` | `[]` | no |
| <a name="input_billing_email"></a> [billing\_email](#input\_billing\_email) | The billing email address for the organization. | `string` | n/a | yes |
| <a name="input_company_name"></a> [company\_name](#input\_company\_name) | The company name associated with the organization. | `string` | n/a | yes |
| <a name="input_enterprise_id"></a> [enterprise\_id](#input\_enterprise\_id) | Optional: The ID of the GitHub Enterprise. If provided, slug lookup is skipped. | `string` | `null` | no |
| <a name="input_enterprise_slug"></a> [enterprise\_slug](#input\_enterprise\_slug) | The slug of the GitHub Enterprise (e.g., 'my-enterprise'). | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The physical location of the organization. | `string` | n/a | yes |
| <a name="input_organization_description"></a> [organization\_description](#input\_organization\_description) | A brief description of the organization. | `string` | n/a | yes |
| <a name="input_organization_display_name"></a> [organization\_display\_name](#input\_organization\_display\_name) | The display name for the organization. | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Optional: The display name for creating a new organization (creation is skipped if not set). | `string` | `null` | no |
| <a name="input_public_email"></a> [public\_email](#input\_public\_email) | The publicly visible email address for the organization. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_repository_permission"></a> [default\_repository\_permission](#output\_default\_repository\_permission) | The default repository permission for organization members. |
| <a name="output_enterprise_organization_id"></a> [enterprise\_organization\_id](#output\_enterprise\_organization\_id) | The ID of the enterprise organization. |
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | The ID of the organization. |
| <a name="output_organization_name"></a> [organization\_name](#output\_organization\_name) | The display name of the organization. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
