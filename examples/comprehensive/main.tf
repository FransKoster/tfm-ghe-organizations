# =============================================================================
# Comprehensive GitHub Enterprise Organization Example
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
  owner    = var.organization_display_name
  base_url = var.github_enterprise_base_url
  # Token or GitHub App credentials configured via environment variables
}

# Comprehensive enterprise organization configuration
module "enterprise_organization" {
  source = "../../"

  # Enterprise configuration
  # You can provide either enterprise_slug or enterprise_id
  enterprise_slug = var.enterprise_slug
  enterprise_id   = var.enterprise_id
  admin_logins    = var.admin_logins
  billing_email   = var.billing_email

  # Organization profile
  organization_name = var.organization_name
  name              = var.organization_display_name
  description       = var.organization_description
  company           = var.company_name
  location          = var.location
  email             = var.public_email
  blog              = var.blog_url
  twitter_username  = var.twitter_handle

  # Advanced Security settings (enable all for maximum security)
  advanced_security_enabled_for_new_repositories               = true
  dependency_graph_enabled_for_new_repositories                = true
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true

  # Member permissions (customize based on organization needs)
  default_repository_permission            = var.default_repo_permission
  members_can_create_internal_repositories = var.allow_internal_repos
  members_can_create_pages                 = var.allow_pages
  members_can_create_private_pages         = var.allow_private_pages
  members_can_create_private_repositories  = var.allow_private_repos
  members_can_create_public_pages          = var.allow_public_pages
  members_can_create_public_repositories   = var.allow_public_repos
  members_can_create_repositories          = var.allow_repo_creation
  members_can_fork_private_repositories    = var.allow_private_forks

  # Project settings
  has_organization_projects = var.enable_org_projects
  has_repository_projects   = var.enable_repo_projects

  # Security requirements
  web_commit_signoff_required = var.require_commit_signoff

  # Toggle: set to true to create the organization (default false)
  # create_enterprise_organization = true
}

# Example: Additional organization security manager using role-based assignment
resource "github_organization_role_team" "security_team" {
  count     = var.security_team_slug != null && var.security_role_id != null ? 1 : 0
  team_slug = var.security_team_slug
  role_id   = var.security_role_id
}

# Example: Organization webhook for security monitoring
resource "github_organization_webhook" "security_webhook" {
  count = var.webhook_url != null ? 1 : 0

  configuration {
    url          = var.webhook_url
    content_type = "json"
    insecure_ssl = false
    secret       = var.webhook_secret
  }

  events = [
    "repository",
    "organization",
    "member",
    "membership"
  ]

  active = true
}
