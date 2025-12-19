# =============================================================================
# Variables for Comprehensive Example
# =============================================================================

# Required enterprise configuration
variable "enterprise_slug" {
  type        = string
  description = "The slug of the GitHub Enterprise (e.g., 'my-enterprise')."
}

variable "enterprise_id" {
  type        = string
  description = "Optional: The ID of the GitHub Enterprise. If provided, slug lookup is skipped."
  default     = null
}

variable "admin_logins" {
  type        = list(string)
  description = "List of GitHub usernames to be organization administrators."
}

variable "billing_email" {
  type        = string
  description = "The billing email address for the organization."
}

# Organization profile
variable "organization_display_name" {
  type        = string
  description = "The display name for the organization."
}

variable "organization_description" {
  type        = string
  description = "A brief description of the organization."
}

variable "company_name" {
  type        = string
  description = "The company name associated with the organization."
}

variable "location" {
  type        = string
  description = "The physical location of the organization."
}

variable "public_email" {
  type        = string
  description = "The publicly visible email address for the organization."
}

variable "organization_name" {
  type        = string
  description = "Optional: The display name for creating a new organization (creation is skipped if not set)."
  default     = null
}

variable "blog_url" {
  type        = string
  description = "The blog URL for the organization."
  default     = null
}

variable "twitter_handle" {
  type        = string
  description = "The Twitter username for the organization (without @)."
  default     = null
}

# Permission settings
variable "default_repo_permission" {
  type        = string
  description = "The default permission for organization members on repositories."
  default     = "read"

  validation {
    condition     = contains(["read", "write", "admin", "none"], var.default_repo_permission)
    error_message = "Default repository permission must be one of: read, write, admin, none."
  }
}

variable "allow_internal_repos" {
  type        = bool
  description = "Whether members can create internal repositories."
  default     = false
}

variable "allow_pages" {
  type        = bool
  description = "Whether members can create GitHub Pages."
  default     = false
}

variable "allow_private_pages" {
  type        = bool
  description = "Whether members can create private GitHub Pages."
  default     = false
}

variable "allow_private_repos" {
  type        = bool
  description = "Whether members can create private repositories."
  default     = false
}

variable "allow_public_pages" {
  type        = bool
  description = "Whether members can create public GitHub Pages."
  default     = false
}

variable "allow_public_repos" {
  type        = bool
  description = "Whether members can create public repositories."
  default     = false
}

variable "allow_repo_creation" {
  type        = bool
  description = "Whether members can create repositories."
  default     = false
}

variable "allow_private_forks" {
  type        = bool
  description = "Whether members can fork private repositories."
  default     = false
}

# Project settings
variable "enable_org_projects" {
  type        = bool
  description = "Whether to enable organization-level projects."
  default     = true
}

variable "enable_repo_projects" {
  type        = bool
  description = "Whether to enable repository-level projects."
  default     = true
}

# Security settings
variable "require_commit_signoff" {
  type        = bool
  description = "Whether to require commit sign-off for web-based commits."
  default     = false
}

# Optional security features
variable "security_team_slug" {
  type        = string
  description = "The slug of the team to assign as security managers (optional)."
  default     = null
}

variable "webhook_url" {
  type        = string
  description = "URL for organization webhook (optional)."
  default     = null
}

variable "webhook_secret" {
  type        = string
  description = "Secret for organization webhook (optional)."
  default     = null
  sensitive   = true
}

variable "security_role_id" {
  type        = number
  description = "Role ID to assign to the security team (optional)."
  default     = null
}
variable "github_enterprise_base_url" {
  type        = string
  description = "The base URL of the GitHub Enterprise instance."
  default     = "https://company.ghe.com/"
}
