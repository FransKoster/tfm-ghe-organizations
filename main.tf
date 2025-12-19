# =============================================================================
# GitHub Enterprise Organization Configuration
# =============================================================================

# Look up enterprise by slug if not providing enterprise_id directly
data "github_enterprise" "this" {
  count = var.enterprise_slug != null && var.enterprise_id == null ? 1 : 0
  slug  = var.enterprise_slug
}

# Create the enterprise organization (basic structure)
resource "github_enterprise_organization" "this" {
  count = var.create_enterprise_organization ? 1 : 0
  # Required attributes for enterprise organization creation
  billing_email = var.billing_email

  # Basic organization information (if creating new)
  description = var.description
  name        = var.organization_name

  # Enterprise-specific attributes
  # Use enterprise_id if provided directly, otherwise look it up from slug
  enterprise_id = var.enterprise_id != null ? var.enterprise_id : data.github_enterprise.this[0].id
  admin_logins  = var.admin_logins
}

# Configure organization settings (detailed configuration)
resource "github_organization_settings" "this" {

  # Basic organization information
  billing_email = var.billing_email
  company       = var.company
  description   = var.description
  email         = var.email
  location      = var.location
  name          = var.name
  blog          = var.blog

  # Social media
  twitter_username = var.twitter_username

  # Advanced Security settings
  advanced_security_enabled_for_new_repositories               = var.advanced_security_enabled_for_new_repositories
  dependency_graph_enabled_for_new_repositories                = var.dependency_graph_enabled_for_new_repositories
  dependabot_alerts_enabled_for_new_repositories               = var.dependabot_alerts_enabled_for_new_repositories
  dependabot_security_updates_enabled_for_new_repositories     = var.dependabot_security_updates_enabled_for_new_repositories
  secret_scanning_enabled_for_new_repositories                 = var.secret_scanning_enabled_for_new_repositories
  secret_scanning_push_protection_enabled_for_new_repositories = var.secret_scanning_push_protection_enabled_for_new_repositories

  # Member permissions and repository settings
  default_repository_permission            = var.default_repository_permission
  members_can_create_internal_repositories = var.members_can_create_internal_repositories
  members_can_create_pages                 = var.members_can_create_pages
  members_can_create_private_pages         = var.members_can_create_private_pages
  members_can_create_private_repositories  = var.members_can_create_private_repositories
  members_can_create_public_pages          = var.members_can_create_public_pages
  members_can_create_public_repositories   = var.members_can_create_public_repositories
  members_can_create_repositories          = var.members_can_create_repositories
  members_can_fork_private_repositories    = var.members_can_fork_private_repositories

  # Project settings
  has_organization_projects = var.has_organization_projects
  has_repository_projects   = var.has_repository_projects

  # Security requirements
  web_commit_signoff_required = var.web_commit_signoff_required
}
