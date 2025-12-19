# =============================================================================
# Outputs for Basic Example
# =============================================================================

output "organization_id" {
  description = "The ID of the organization."
  value       = module.enterprise_organization.organization_id
}

output "enterprise_organization_id" {
  description = "The ID of the enterprise organization."
  value       = module.enterprise_organization.enterprise_organization_id
}

output "organization_name" {
  description = "The display name of the organization."
  value       = module.enterprise_organization.organization_name
}

output "default_repository_permission" {
  description = "The default repository permission for organization members."
  value       = module.enterprise_organization.default_repository_permission
}
