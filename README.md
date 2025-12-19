---
post_title: "GitHub Enterprise Organization Terraform Module"
author1: "Automation"
post_slug: "github-enterprise-organization-terraform-module"
microsoft_alias: "automation"
featured_image: ""
categories:
  - devops
tags:
  - terraform
  - github
ai_note: "This content was generated with AI assistance."
summary: "Terraform module to create and manage GitHub Enterprise organizations with security-first defaults."
post_date: "2025-12-18"
---

## GitHub Enterprise Organization Terraform Module

A comprehensive Terraform module to create and manage GitHub Enterprise organizations with security-first defaults.

## Overview

This module creates and configures GitHub Enterprise organizations using both `github_enterprise_organization` for basic organization creation and `github_organization_settings` for detailed configuration. It emphasizes security best practices while providing flexibility for different organizational needs.

## Features

- **Enterprise Organization Creation**: Create new organizations within a GitHub Enterprise
- **Comprehensive Security Configuration**: Enable GitHub Advanced Security features by default
- **Granular Permission Controls**: Fine-grained member permission settings following least privilege principles
- **Project and Repository Management**: Configure organization and repository project settings
- **Security Scanning**: Enable secret scanning, Dependabot, and dependency graph for all new repositories
- **Flexible Configuration**: Support for all available GitHub organization settings

## Prerequisites

- **Terraform**: Version 1.6.0 or higher
- **GitHub Provider**: Version 6.8.3 or higher (< 7.0.0)
- **GitHub Enterprise**: Access to a GitHub Enterprise instance
- **Authentication**: GitHub token or GitHub App credentials with:
  - `admin:org` permissions
  - Enterprise admin permissions (for organization creation)
  - SSO authorization for the target organization

## Usage

### Basic Example

```hcl
module "enterprise_organization" {
  source = "./path-to-this-module"

  # Required enterprise configuration
  # Module will automatically look up the enterprise ID from the slug
  enterprise_slug = "my-enterprise"
  admin_logins    = ["admin-username"]
  billing_email   = "billing@yourcompany.com"

  # Basic organization settings
  name        = "Your Organization"
  description = "A secure development organization"
  company     = "Your Company"
  location    = "Your Location"

  # Security-first defaults (already enabled by default)
  advanced_security_enabled_for_new_repositories = true
  secret_scanning_enabled_for_new_repositories   = true
  dependabot_alerts_enabled_for_new_repositories = true
}
```

### Comprehensive Example

```hcl
module "enterprise_organization" {
  source = "./path-to-this-module"

  # Enterprise configuration
  # You can provide either enterprise_slug (recommended) or enterprise_id
  enterprise_slug = "my-enterprise"
  admin_logins    = ["admin1", "admin2"]
  billing_email   = "billing@yourcompany.com"

  # Organization profile
  name             = "Development Organization"
  description      = "Secure software development organization"
  company          = "Your Company"
  location         = "San Francisco, CA"
  email            = "dev-org@yourcompany.com"
  blog             = "https://blog.yourcompany.com"
  twitter_username = "yourcompany"

  # Security settings (customize as needed)
  advanced_security_enabled_for_new_repositories                = true
  secret_scanning_enabled_for_new_repositories                  = true
  secret_scanning_push_protection_enabled_for_new_repositories  = true
  dependabot_alerts_enabled_for_new_repositories                = true
  dependabot_security_updates_enabled_for_new_repositories      = true
  dependency_graph_enabled_for_new_repositories                 = true

  # Member permissions (restrictive defaults)
  default_repository_permission           = "read"
  members_can_create_repositories          = false
  members_can_create_private_repositories  = false
  members_can_create_public_repositories   = false
  members_can_fork_private_repositories    = false

  # Project settings
  has_organization_projects = true
  has_repository_projects   = true

  # Security requirements
  web_commit_signoff_required = true
}
```

## Enterprise Discovery

The module automatically looks up the enterprise ID from the enterprise slug using the `github_enterprise` data source. You have two options:

1. **Recommended**: Provide `enterprise_slug` - the module will automatically resolve it to the enterprise ID

   ```hcl
   enterprise_slug = "my-enterprise"
   ```

2. **Alternative**: Provide `enterprise_id` directly if you already know it
   ```hcl
   enterprise_id = "MDEyOkVudGVycHJpc2UxMjM="
   ```

Note: Slug-based discovery requires your token to include the `read:enterprise` scope. If you don't have that scope, pass `enterprise_id` instead to bypass the discovery.

## Organization Creation Toggle

By default this module only configures an existing organization. To create a new organization inside your Enterprise, enable the toggle and provide an organization name.

```hcl
module "enterprise_organization" {
  source = "./path-to-this-module"

  # Enterprise reference (one of the following)
  enterprise_slug = "my-enterprise"  # requires token scope read:enterprise
  # enterprise_id   = "MDEyOkVudGVycHJpc2UxMjM="

  # Creation toggle
  create_enterprise_organization = true
  organization_name              = "My New Org"

  billing_email = "billing@yourcompany.com"
  admin_logins  = ["admin1", "admin2"]
}
```

## Security Best Practices

This module implements security-first defaults:

### Advanced Security Features

- **GitHub Advanced Security**: Enabled by default for new repositories
- **Secret Scanning**: Enabled with push protection
- **Dependabot**: Alerts and security updates enabled
- **Dependency Graph**: Enabled for vulnerability tracking

### Access Controls

- **Least Privilege**: Default repository permission set to "read"
- **Repository Creation**: Disabled by default for members
- **Fork Restrictions**: Private repository forking disabled
- **Public Repository**: Creation disabled by default

### Monitoring and Compliance

- **Commit Signoff**: Optional web commit signature requirement
- **Audit Trail**: All organization changes tracked through Terraform state

## Examples

Detailed examples are available in the `examples/` directory:

- **[Basic Example](./examples/basic/)**: Minimal configuration for quick setup
- **[Comprehensive Example](./examples/comprehensive/)**: Full-featured configuration with all options

## Module Structure

```
.
├── main.tf                    # Main module resources
├── variables.tf               # Input variables
├── outputs.tf                 # Output values
├── providers.tf              # Provider requirements
├── terraform.tfvars.example  # Example variable values
├── examples/
│   ├── basic/               # Basic usage example
│   └── comprehensive/       # Comprehensive usage example
└── README.md               # This file
```

## Authentication

### Environment Variables

```bash
export GITHUB_TOKEN="your-github-token"
# or
export GITHUB_APP_ID="your-app-id"
export GITHUB_APP_INSTALLATION_ID="your-installation-id"
export GITHUB_APP_PEM_FILE="path-to-private-key.pem"
```

### Provider Configuration

```hcl
provider "github" {
  # Configuration via environment variables
  # or explicit configuration for GitHub Enterprise Server
  base_url = "https://github.yourcompany.com/api/v3/"
}
```

## Terraform Requirements

| Name      | Version           |
| --------- | ----------------- |
| terraform | >= 1.6.0          |
| github    | >= 6.8.3, < 7.0.0 |

## Resources Created

| Resource                         | Description                                                                                    |
| -------------------------------- | ---------------------------------------------------------------------------------------------- |
| `github_enterprise_organization` | Creates the enterprise organization (optional, controlled by `create_enterprise_organization`) |
| `github_organization_settings`   | Configures organization settings and policies                                                  |

## Important Notes

1. **Enterprise Permissions**: Ensure your authentication has enterprise-level permissions for organization creation
2. **Existing Organizations**: This module can also configure existing organizations by omitting the `organization_name` variable
3. **State Management**: Store Terraform state securely as it may contain sensitive organization information
4. **Incremental Changes**: The module supports incremental updates to organization settings
5. **Security Defaults**: Review and customize security settings based on your organization's requirements
6. **Token Scopes**: Slug-based enterprise discovery requires `read:enterprise`; use `enterprise_id` to avoid this requirement

## Contributing

Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on contributing to this module.

## Testing

See [TESTING.md](./TESTING.md) for information about testing this module.

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for release history and changes.
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

No modules.

## Resources

| Name | Type |
|------|------|
| [github_enterprise_organization.this](https://registry.terraform.io/providers/integrations/github/6.8.3/docs/resources/enterprise_organization) | resource |
| [github_organization_settings.this](https://registry.terraform.io/providers/integrations/github/6.8.3/docs/resources/organization_settings) | resource |
| [github_enterprise.this](https://registry.terraform.io/providers/integrations/github/6.8.3/docs/data-sources/enterprise) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_logins"></a> [admin\_logins](#input\_admin\_logins) | List of organization admin usernames. | `list(string)` | `[]` | no |
| <a name="input_advanced_security_enabled_for_new_repositories"></a> [advanced\_security\_enabled\_for\_new\_repositories](#input\_advanced\_security\_enabled\_for\_new\_repositories) | Whether GitHub Advanced Security is enabled for new repositories by default. | `bool` | `true` | no |
| <a name="input_billing_email"></a> [billing\_email](#input\_billing\_email) | The billing email address for the organization. | `string` | n/a | yes |
| <a name="input_blog"></a> [blog](#input\_blog) | The blog URL for the organization. | `string` | `null` | no |
| <a name="input_company"></a> [company](#input\_company) | The company name associated with the organization. | `string` | `null` | no |
| <a name="input_create_enterprise_organization"></a> [create\_enterprise\_organization](#input\_create\_enterprise\_organization) | Whether to create a new enterprise organization. If false, only organization settings are managed. | `bool` | `false` | no |
| <a name="input_default_repository_permission"></a> [default\_repository\_permission](#input\_default\_repository\_permission) | The default permission level for organization members for repositories. | `string` | `"read"` | no |
| <a name="input_dependabot_alerts_enabled_for_new_repositories"></a> [dependabot\_alerts\_enabled\_for\_new\_repositories](#input\_dependabot\_alerts\_enabled\_for\_new\_repositories) | Whether Dependabot alerts are enabled for new repositories by default. | `bool` | `true` | no |
| <a name="input_dependabot_security_updates_enabled_for_new_repositories"></a> [dependabot\_security\_updates\_enabled\_for\_new\_repositories](#input\_dependabot\_security\_updates\_enabled\_for\_new\_repositories) | Whether Dependabot security updates are enabled for new repositories by default. | `bool` | `true` | no |
| <a name="input_dependency_graph_enabled_for_new_repositories"></a> [dependency\_graph\_enabled\_for\_new\_repositories](#input\_dependency\_graph\_enabled\_for\_new\_repositories) | Whether dependency graph is enabled for new repositories by default. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the organization. | `string` | `null` | no |
| <a name="input_email"></a> [email](#input\_email) | The publicly visible email address for the organization. | `string` | `null` | no |
| <a name="input_enterprise_id"></a> [enterprise\_id](#input\_enterprise\_id) | The ID of the enterprise that will own the organization. Either this or enterprise\_slug must be provided. | `string` | `null` | no |
| <a name="input_enterprise_slug"></a> [enterprise\_slug](#input\_enterprise\_slug) | The slug of the enterprise (e.g., 'my-enterprise'). Either this or enterprise\_id must be provided. | `string` | `null` | no |
| <a name="input_github_enterprise_base_url"></a> [github\_enterprise\_base\_url](#input\_github\_enterprise\_base\_url) | The base URL of the GitHub Enterprise instance. | `string` | `"https://company.ghe.com/"` | no |
| <a name="input_has_organization_projects"></a> [has\_organization\_projects](#input\_has\_organization\_projects) | Whether organization projects are enabled for the organization. | `bool` | `true` | no |
| <a name="input_has_repository_projects"></a> [has\_repository\_projects](#input\_has\_repository\_projects) | Whether repository projects are enabled for the organization. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the organization. | `string` | `null` | no |
| <a name="input_members_can_create_internal_repositories"></a> [members\_can\_create\_internal\_repositories](#input\_members\_can\_create\_internal\_repositories) | Whether organization members can create internal repositories. | `bool` | `false` | no |
| <a name="input_members_can_create_pages"></a> [members\_can\_create\_pages](#input\_members\_can\_create\_pages) | Whether organization members can create pages. | `bool` | `false` | no |
| <a name="input_members_can_create_private_pages"></a> [members\_can\_create\_private\_pages](#input\_members\_can\_create\_private\_pages) | Whether organization members can create private pages. | `bool` | `false` | no |
| <a name="input_members_can_create_private_repositories"></a> [members\_can\_create\_private\_repositories](#input\_members\_can\_create\_private\_repositories) | Whether organization members can create private repositories. | `bool` | `false` | no |
| <a name="input_members_can_create_public_pages"></a> [members\_can\_create\_public\_pages](#input\_members\_can\_create\_public\_pages) | Whether organization members can create public pages. | `bool` | `false` | no |
| <a name="input_members_can_create_public_repositories"></a> [members\_can\_create\_public\_repositories](#input\_members\_can\_create\_public\_repositories) | Whether organization members can create public repositories. | `bool` | `false` | no |
| <a name="input_members_can_create_repositories"></a> [members\_can\_create\_repositories](#input\_members\_can\_create\_repositories) | Whether organization members can create repositories. | `bool` | `false` | no |
| <a name="input_members_can_fork_private_repositories"></a> [members\_can\_fork\_private\_repositories](#input\_members\_can\_fork\_private\_repositories) | Whether organization members can fork private repositories. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The display name for the organization. | `string` | `null` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | The name of the organization to create (for new organizations). | `string` | `null` | no |
| <a name="input_secret_scanning_enabled_for_new_repositories"></a> [secret\_scanning\_enabled\_for\_new\_repositories](#input\_secret\_scanning\_enabled\_for\_new\_repositories) | Whether secret scanning is enabled for new repositories by default. | `bool` | `true` | no |
| <a name="input_secret_scanning_push_protection_enabled_for_new_repositories"></a> [secret\_scanning\_push\_protection\_enabled\_for\_new\_repositories](#input\_secret\_scanning\_push\_protection\_enabled\_for\_new\_repositories) | Whether secret scanning push protection is enabled for new repositories by default. | `bool` | `true` | no |
| <a name="input_twitter_username"></a> [twitter\_username](#input\_twitter\_username) | The Twitter username associated with the organization. | `string` | `null` | no |
| <a name="input_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#input\_web\_commit\_signoff\_required) | Whether commit signatures are required for commits to the organization. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_advanced_security_enabled_for_new_repositories"></a> [advanced\_security\_enabled\_for\_new\_repositories](#output\_advanced\_security\_enabled\_for\_new\_repositories) | Whether GitHub Advanced Security is enabled for new repositories by default. |
| <a name="output_billing_email"></a> [billing\_email](#output\_billing\_email) | The billing email address for the organization. |
| <a name="output_blog"></a> [blog](#output\_blog) | The blog URL for the organization. |
| <a name="output_company"></a> [company](#output\_company) | The company name associated with the organization. |
| <a name="output_default_repository_permission"></a> [default\_repository\_permission](#output\_default\_repository\_permission) | The default permission level for organization members for repositories. |
| <a name="output_dependabot_alerts_enabled_for_new_repositories"></a> [dependabot\_alerts\_enabled\_for\_new\_repositories](#output\_dependabot\_alerts\_enabled\_for\_new\_repositories) | Whether Dependabot alerts are enabled for new repositories by default. |
| <a name="output_dependabot_security_updates_enabled_for_new_repositories"></a> [dependabot\_security\_updates\_enabled\_for\_new\_repositories](#output\_dependabot\_security\_updates\_enabled\_for\_new\_repositories) | Whether Dependabot security updates are enabled for new repositories by default. |
| <a name="output_dependency_graph_enabled_for_new_repositories"></a> [dependency\_graph\_enabled\_for\_new\_repositories](#output\_dependency\_graph\_enabled\_for\_new\_repositories) | Whether dependency graph is enabled for new repositories by default. |
| <a name="output_enterprise_organization_database_id"></a> [enterprise\_organization\_database\_id](#output\_enterprise\_organization\_database\_id) | The database ID of the enterprise organization (null when creation disabled). |
| <a name="output_enterprise_organization_id"></a> [enterprise\_organization\_id](#output\_enterprise\_organization\_id) | The ID of the enterprise organization (null when creation disabled). |
| <a name="output_has_organization_projects"></a> [has\_organization\_projects](#output\_has\_organization\_projects) | Whether organization projects are enabled. |
| <a name="output_has_repository_projects"></a> [has\_repository\_projects](#output\_has\_repository\_projects) | Whether repository projects are enabled. |
| <a name="output_location"></a> [location](#output\_location) | The location of the organization. |
| <a name="output_organization_description"></a> [organization\_description](#output\_organization\_description) | The description of the organization. |
| <a name="output_organization_email"></a> [organization\_email](#output\_organization\_email) | The publicly visible email address for the organization. |
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | The ID of the organization from settings. |
| <a name="output_organization_name"></a> [organization\_name](#output\_organization\_name) | The display name of the organization. |
| <a name="output_secret_scanning_enabled_for_new_repositories"></a> [secret\_scanning\_enabled\_for\_new\_repositories](#output\_secret\_scanning\_enabled\_for\_new\_repositories) | Whether secret scanning is enabled for new repositories by default. |
| <a name="output_secret_scanning_push_protection_enabled_for_new_repositories"></a> [secret\_scanning\_push\_protection\_enabled\_for\_new\_repositories](#output\_secret\_scanning\_push\_protection\_enabled\_for\_new\_repositories) | Whether secret scanning push protection is enabled for new repositories by default. |
| <a name="output_twitter_username"></a> [twitter\_username](#output\_twitter\_username) | The Twitter username associated with the organization. |
| <a name="output_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#output\_web\_commit\_signoff\_required) | Whether commit signatures are required for commits to the organization. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
