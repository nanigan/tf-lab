# ─────────────────────────────────────────────
# Terraform Configuration
# ─────────────────────────────────────────────
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    # These values are overridden at runtime via CLI in GitHub Actions
    resource_group_name  = "rg-cummins-tf-lab"
    storage_account_name = "stgsnefftflab"
    container_name       = "tfstate"
    key                  = "PLACEHOLDER"
    use_oidc             = true
  }
}

# ─────────────────────────────────────────────
# Azure Provider Configuration (OIDC for GitHub Actions)
# ─────────────────────────────────────────────
provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id

  use_oidc = true
}

# ─────────────────────────────────────────────
# Resource Group Definition
# ─────────────────────────────────────────────
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ─────────────────────────────────────────────
# Outputs
# ─────────────────────────────────────────────
output "resource_group_name" {
  description = "The name of the created or imported resource group"
  value       = azurerm_resource_group.rg.name
}
