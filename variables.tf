# =============================================================================
# Variables for GitHub Enterprise Organization Configuration
# =============================================================================

# Enterprise organization configuration
variable "create_enterprise_organization" {
  type        = bool
  description = "Whether to create a new enterprise organization. If false, only organization settings are managed."
  default     = false
}

variable "enterprise_slug" {
  type        = string
  description = "The slug of the enterprise (e.g., 'my-enterprise'). Either this or enterprise_id must be provided."
  default     = null
}

variable "enterprise_id" {
  type        = string
  description = "The ID of the enterprise that will own the organization. Either this or enterprise_slug must be provided."
  default     = null
}

variable "admin_logins" {
  type        = list(string)
  description = "List of organization admin usernames."
  default     = []
}

variable "organization_name" {
  type        = string
  description = "The name of the organization to create (for new organizations)."
  default     = null
}

# Basic organization configuration
variable "billing_email" {
  type        = string
  description = "The billing email address for the organization."
}

variable "company" {
  type        = string
  description = "The company name associated with the organization."
  default     = null
}

variable "description" {
  type        = string
  description = "The description of the organization."
  default     = null
}

variable "email" {
  type        = string
  description = "The publicly visible email address for the organization."
  default     = null
}

variable "location" {
  type        = string
  description = "The location of the organization."
  default     = null
}

variable "name" {
  type        = string
  description = "The display name for the organization."
  default     = null
}

variable "twitter_username" {
  type        = string
  description = "The Twitter username associated with the organization."
  default     = null
}

variable "blog" {
  type        = string
  description = "The blog URL for the organization."
  default     = null
}

# Security and Advanced Security settings
variable "advanced_security_enabled_for_new_repositories" {
  type        = bool
  description = "Whether GitHub Advanced Security is enabled for new repositories by default."
  default     = true
}

variable "dependency_graph_enabled_for_new_repositories" {
  type        = bool
  description = "Whether dependency graph is enabled for new repositories by default."
  default     = true
}

variable "dependabot_alerts_enabled_for_new_repositories" {
  type        = bool
  description = "Whether Dependabot alerts are enabled for new repositories by default."
  default     = true
}

variable "dependabot_security_updates_enabled_for_new_repositories" {
  type        = bool
  description = "Whether Dependabot security updates are enabled for new repositories by default."
  default     = true
}

variable "secret_scanning_enabled_for_new_repositories" {
  type        = bool
  description = "Whether secret scanning is enabled for new repositories by default."
  default     = true
}

variable "secret_scanning_push_protection_enabled_for_new_repositories" {
  type        = bool
  description = "Whether secret scanning push protection is enabled for new repositories by default."
  default     = true
}



# Member permissions and access controls
variable "default_repository_permission" {
  type        = string
  description = "The default permission level for organization members for repositories."
  default     = "read"

  validation {
    condition     = contains(["read", "write", "admin", "none"], var.default_repository_permission)
    error_message = "The default_repository_permission must be one of: read, write, admin, none."
  }
}

variable "members_can_create_internal_repositories" {
  type        = bool
  description = "Whether organization members can create internal repositories."
  default     = false
}

variable "members_can_create_pages" {
  type        = bool
  description = "Whether organization members can create pages."
  default     = false
}

variable "members_can_create_private_pages" {
  type        = bool
  description = "Whether organization members can create private pages."
  default     = false
}

variable "members_can_create_private_repositories" {
  type        = bool
  description = "Whether organization members can create private repositories."
  default     = false
}

variable "members_can_create_public_pages" {
  type        = bool
  description = "Whether organization members can create public pages."
  default     = false
}

variable "members_can_create_public_repositories" {
  type        = bool
  description = "Whether organization members can create public repositories."
  default     = false
}

variable "members_can_create_repositories" {
  type        = bool
  description = "Whether organization members can create repositories."
  default     = false
}

variable "members_can_fork_private_repositories" {
  type        = bool
  description = "Whether organization members can fork private repositories."
  default     = false
}

# Project settings
variable "has_organization_projects" {
  type        = bool
  description = "Whether organization projects are enabled for the organization."
  default     = true
}

variable "has_repository_projects" {
  type        = bool
  description = "Whether repository projects are enabled for the organization."
  default     = true
}

# Security requirements
variable "web_commit_signoff_required" {
  type        = bool
  description = "Whether commit signatures are required for commits to the organization."
  default     = false
}
variable "github_enterprise_base_url" {
  type        = string
  description = "The base URL of the GitHub Enterprise instance."
  default     = "https://company.ghe.com/"
}
