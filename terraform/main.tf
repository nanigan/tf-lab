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

