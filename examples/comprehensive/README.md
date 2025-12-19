# comprehensive

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.8.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.8.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_enterprise_organization"></a> [enterprise\_organization](#module\_enterprise\_organization) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [github_organization_role_team.security_team](https://registry.terraform.io/providers/integrations/github/6.8.3/docs/resources/organization_role_team) | resource |
| [github_organization_webhook.security_webhook](https://registry.terraform.io/providers/integrations/github/6.8.3/docs/resources/organization_webhook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_logins"></a> [admin\_logins](#input\_admin\_logins) | List of GitHub usernames to be organization administrators. | `list(string)` | n/a | yes |
| <a name="input_allow_internal_repos"></a> [allow\_internal\_repos](#input\_allow\_internal\_repos) | Whether members can create internal repositories. | `bool` | `false` | no |
| <a name="input_allow_pages"></a> [allow\_pages](#input\_allow\_pages) | Whether members can create GitHub Pages. | `bool` | `false` | no |
| <a name="input_allow_private_forks"></a> [allow\_private\_forks](#input\_allow\_private\_forks) | Whether members can fork private repositories. | `bool` | `false` | no |
| <a name="input_allow_private_pages"></a> [allow\_private\_pages](#input\_allow\_private\_pages) | Whether members can create private GitHub Pages. | `bool` | `false` | no |
| <a name="input_allow_private_repos"></a> [allow\_private\_repos](#input\_allow\_private\_repos) | Whether members can create private repositories. | `bool` | `false` | no |
| <a name="input_allow_public_pages"></a> [allow\_public\_pages](#input\_allow\_public\_pages) | Whether members can create public GitHub Pages. | `bool` | `false` | no |
| <a name="input_allow_public_repos"></a> [allow\_public\_repos](#input\_allow\_public\_repos) | Whether members can create public repositories. | `bool` | `false` | no |
| <a name="input_allow_repo_creation"></a> [allow\_repo\_creation](#input\_allow\_repo\_creation) | Whether members can create repositories. | `bool` | `false` | no |
| <a name="input_billing_email"></a> [billing\_email](#input\_billing\_email) | The billing email address for the organization. | `string` | n/a | yes |
| <a name="input_blog_url"></a> [blog\_url](#input\_blog\_url) | The blog URL for the organization. | `string` | `null` | no |
| <a name="input_company_name"></a> [company\_name](#input\_company\_name) | The company name associated with the organization. | `string` | n/a | yes |
| <a name="input_default_repo_permission"></a> [default\_repo\_permission](#input\_default\_repo\_permission) | The default permission for organization members on repositories. | `string` | `"read"` | no |
| <a name="input_enable_org_projects"></a> [enable\_org\_projects](#input\_enable\_org\_projects) | Whether to enable organization-level projects. | `bool` | `true` | no |
| <a name="input_enable_repo_projects"></a> [enable\_repo\_projects](#input\_enable\_repo\_projects) | Whether to enable repository-level projects. | `bool` | `true` | no |
| <a name="input_enterprise_id"></a> [enterprise\_id](#input\_enterprise\_id) | Optional: The ID of the GitHub Enterprise. If provided, slug lookup is skipped. | `string` | `null` | no |
| <a name="input_enterprise_slug"></a> [enterprise\_slug](#input\_enterprise\_slug) | The slug of the GitHub Enterprise (e.g., 'my-enterprise'). | `string` | n/a | yes |
| <a name="input_github_enterprise_base_url"></a> [github\_enterprise\_base\_url](#input\_github\_enterprise\_base\_url) | The base URL of the GitHub Enterprise instance. | `string` | `"https://prorail.ghe.com/"` | no |
| <a name="input_location"></a> [location](#input\_location) | The physical location of the organization. | `string` | n/a | yes |
| <a name="input_organization_description"></a> [organization\_description](#input\_organization\_description) | A brief description of the organization. | `string` | n/a | yes |
| <a name="input_organization_display_name"></a> [organization\_display\_name](#input\_organization\_display\_name) | The display name for the organization. | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Optional: The display name for creating a new organization (creation is skipped if not set). | `string` | `null` | no |
| <a name="input_public_email"></a> [public\_email](#input\_public\_email) | The publicly visible email address for the organization. | `string` | n/a | yes |
| <a name="input_require_commit_signoff"></a> [require\_commit\_signoff](#input\_require\_commit\_signoff) | Whether to require commit sign-off for web-based commits. | `bool` | `false` | no |
| <a name="input_security_role_id"></a> [security\_role\_id](#input\_security\_role\_id) | Role ID to assign to the security team (optional). | `number` | `null` | no |
| <a name="input_security_team_slug"></a> [security\_team\_slug](#input\_security\_team\_slug) | The slug of the team to assign as security managers (optional). | `string` | `null` | no |
| <a name="input_twitter_handle"></a> [twitter\_handle](#input\_twitter\_handle) | The Twitter username for the organization (without @). | `string` | `null` | no |
| <a name="input_webhook_secret"></a> [webhook\_secret](#input\_webhook\_secret) | Secret for organization webhook (optional). | `string` | `null` | no |
| <a name="input_webhook_url"></a> [webhook\_url](#input\_webhook\_url) | URL for organization webhook (optional). | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_advanced_security_enabled"></a> [advanced\_security\_enabled](#output\_advanced\_security\_enabled) | Whether GitHub Advanced Security is enabled for new repositories. |
| <a name="output_company"></a> [company](#output\_company) | The company name associated with the organization. |
| <a name="output_default_repository_permission"></a> [default\_repository\_permission](#output\_default\_repository\_permission) | The default repository permission for organization members. |
| <a name="output_dependabot_alerts_enabled"></a> [dependabot\_alerts\_enabled](#output\_dependabot\_alerts\_enabled) | Whether Dependabot alerts are enabled for new repositories. |
| <a name="output_enterprise_organization_database_id"></a> [enterprise\_organization\_database\_id](#output\_enterprise\_organization\_database\_id) | The database ID of the enterprise organization. |
| <a name="output_enterprise_organization_id"></a> [enterprise\_organization\_id](#output\_enterprise\_organization\_id) | The ID of the enterprise organization. |
| <a name="output_has_organization_projects"></a> [has\_organization\_projects](#output\_has\_organization\_projects) | Whether organization projects are enabled. |
| <a name="output_has_repository_projects"></a> [has\_repository\_projects](#output\_has\_repository\_projects) | Whether repository projects are enabled. |
| <a name="output_location"></a> [location](#output\_location) | The location of the organization. |
| <a name="output_organization_description"></a> [organization\_description](#output\_organization\_description) | The description of the organization. |
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | The ID of the organization. |
| <a name="output_organization_name"></a> [organization\_name](#output\_organization\_name) | The display name of the organization. |
| <a name="output_secret_scanning_enabled"></a> [secret\_scanning\_enabled](#output\_secret\_scanning\_enabled) | Whether secret scanning is enabled for new repositories. |
| <a name="output_secret_scanning_push_protection_enabled"></a> [secret\_scanning\_push\_protection\_enabled](#output\_secret\_scanning\_push\_protection\_enabled) | Whether secret scanning push protection is enabled for new repositories. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
