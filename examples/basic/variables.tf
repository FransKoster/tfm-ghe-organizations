# =============================================================================
# Variables for Basic Example
# =============================================================================

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
  default     = []
}

variable "billing_email" {
  type        = string
  description = "The billing email address for the organization."
}

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
