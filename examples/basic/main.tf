# =============================================================================
# Basic GitHub Enterprise Organization Example
# =============================================================================

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.8.3"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  # Token or GitHub App credentials configured via environment variables
}

# Basic enterprise organization configuration
module "enterprise_organization" {
  source = "../../"

  # Required enterprise configuration
  # You can provide either enterprise_slug or enterprise_id
  enterprise_slug = var.enterprise_slug
  enterprise_id   = var.enterprise_id
  admin_logins    = var.admin_logins
  billing_email   = var.billing_email

  # Basic organization settings
  organization_name = var.organization_name
  name              = var.organization_display_name
  description       = var.organization_description
  company           = var.company_name
  location          = var.location
  email             = var.public_email

  # Security-first defaults
  advanced_security_enabled_for_new_repositories               = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true

  # Restrictive member permissions
  default_repository_permission           = "read"
  members_can_create_repositories         = false
  members_can_create_private_repositories = false
  members_can_create_public_repositories  = false
  members_can_fork_private_repositories   = false

  # Toggle: set to true to create the organization (default false)
  # create_enterprise_organization = true
}
