terraform {
  required_version = ">= 1.6.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.9.1"
    }
  }
}
provider "github" {
  owner    = var.organization_name
  base_url = var.github_enterprise_base_url
  # Token or GitHub App credentials configured via environment variables
}
