# =============================================================================
# Outputs for GitHub Enterprise Organization
# =============================================================================

# Enterprise organization outputs
output "enterprise_organization_id" {
  description = "The ID of the enterprise organization (null when creation disabled)."
  value       = length(github_enterprise_organization.this) > 0 ? github_enterprise_organization.this[0].id : null
}

output "enterprise_organization_database_id" {
  description = "The database ID of the enterprise organization (null when creation disabled)."
  value       = length(github_enterprise_organization.this) > 0 ? github_enterprise_organization.this[0].database_id : null
}

# Organization settings outputs
output "organization_id" {
  description = "The ID of the organization from settings."
  value       = github_organization_settings.this.id
}

output "organization_name" {
  description = "The display name of the organization."
  value       = github_organization_settings.this.name
}

output "organization_description" {
  description = "The description of the organization."
  value       = github_organization_settings.this.description
}

output "organization_email" {
  description = "The publicly visible email address for the organization."
  value       = github_organization_settings.this.email
  sensitive   = true
}

output "billing_email" {
  description = "The billing email address for the organization."
  value       = github_organization_settings.this.billing_email
  sensitive   = true
}

output "company" {
  description = "The company name associated with the organization."
  value       = github_organization_settings.this.company
}

output "location" {
  description = "The location of the organization."
  value       = github_organization_settings.this.location
}

output "blog" {
  description = "The blog URL for the organization."
  value       = github_organization_settings.this.blog
}

output "twitter_username" {
  description = "The Twitter username associated with the organization."
  value       = github_organization_settings.this.twitter_username
}

output "default_repository_permission" {
  description = "The default permission level for organization members for repositories."
  value       = github_organization_settings.this.default_repository_permission
}

output "advanced_security_enabled_for_new_repositories" {
  description = "Whether GitHub Advanced Security is enabled for new repositories by default."
  value       = github_organization_settings.this.advanced_security_enabled_for_new_repositories
}

output "secret_scanning_enabled_for_new_repositories" {
  description = "Whether secret scanning is enabled for new repositories by default."
  value       = github_organization_settings.this.secret_scanning_enabled_for_new_repositories
}

output "secret_scanning_push_protection_enabled_for_new_repositories" {
  description = "Whether secret scanning push protection is enabled for new repositories by default."
  value       = github_organization_settings.this.secret_scanning_push_protection_enabled_for_new_repositories
}

output "dependabot_alerts_enabled_for_new_repositories" {
  description = "Whether Dependabot alerts are enabled for new repositories by default."
  value       = github_organization_settings.this.dependabot_alerts_enabled_for_new_repositories
}

output "dependabot_security_updates_enabled_for_new_repositories" {
  description = "Whether Dependabot security updates are enabled for new repositories by default."
  value       = github_organization_settings.this.dependabot_security_updates_enabled_for_new_repositories
}

output "dependency_graph_enabled_for_new_repositories" {
  description = "Whether dependency graph is enabled for new repositories by default."
  value       = github_organization_settings.this.dependency_graph_enabled_for_new_repositories
}

output "has_organization_projects" {
  description = "Whether organization projects are enabled."
  value       = github_organization_settings.this.has_organization_projects
}

output "has_repository_projects" {
  description = "Whether repository projects are enabled."
  value       = github_organization_settings.this.has_repository_projects
}

output "web_commit_signoff_required" {
  description = "Whether commit signatures are required for commits to the organization."
  value       = github_organization_settings.this.web_commit_signoff_required
}
