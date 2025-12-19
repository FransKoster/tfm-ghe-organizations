# =============================================================================
# Outputs for Comprehensive Example
# =============================================================================

# Organization identifiers
output "organization_id" {
  description = "The ID of the organization."
  value       = module.enterprise_organization.organization_id
}

output "enterprise_organization_id" {
  description = "The ID of the enterprise organization."
  value       = module.enterprise_organization.enterprise_organization_id
}

output "enterprise_organization_database_id" {
  description = "The database ID of the enterprise organization."
  value       = module.enterprise_organization.enterprise_organization_database_id
}

# Organization details
output "organization_name" {
  description = "The display name of the organization."
  value       = module.enterprise_organization.organization_name
}

output "organization_description" {
  description = "The description of the organization."
  value       = module.enterprise_organization.organization_description
}

output "company" {
  description = "The company name associated with the organization."
  value       = module.enterprise_organization.company
}

output "location" {
  description = "The location of the organization."
  value       = module.enterprise_organization.location
}

# Security settings
output "advanced_security_enabled" {
  description = "Whether GitHub Advanced Security is enabled for new repositories."
  value       = module.enterprise_organization.advanced_security_enabled_for_new_repositories
}

output "secret_scanning_enabled" {
  description = "Whether secret scanning is enabled for new repositories."
  value       = module.enterprise_organization.secret_scanning_enabled_for_new_repositories
}

output "secret_scanning_push_protection_enabled" {
  description = "Whether secret scanning push protection is enabled for new repositories."
  value       = module.enterprise_organization.secret_scanning_push_protection_enabled_for_new_repositories
}

output "dependabot_alerts_enabled" {
  description = "Whether Dependabot alerts are enabled for new repositories."
  value       = module.enterprise_organization.dependabot_alerts_enabled_for_new_repositories
}

# Permission settings
output "default_repository_permission" {
  description = "The default repository permission for organization members."
  value       = module.enterprise_organization.default_repository_permission
}

# Project settings
output "has_organization_projects" {
  description = "Whether organization projects are enabled."
  value       = module.enterprise_organization.has_organization_projects
}

output "has_repository_projects" {
  description = "Whether repository projects are enabled."
  value       = module.enterprise_organization.has_repository_projects
}
