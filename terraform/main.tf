# ─────────────────────────────────────────────
# Azure Provider Configuration (Federated Auth)
# ─────────────────────────────────────────────
provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id

  use_oidc = true  # ✅ Required for GitHub Actions OIDC authentication
}

# ─────────────────────────────────────────────
# Tag Logic (Inline "module")
# ─────────────────────────────────────────────
locals {
  default_tags = {
    created_by = "terraform"
  }

  merged_tags = merge(local.default_tags, var.tags)
}

# ─────────────────────────────────────────────
# Resource Group Definition
# ─────────────────────────────────────────────
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.merged_tags
}

# ─────────────────────────────────────────────
# Outputs (Used in CI/CD or for reference)
# ─────────────────────────────────────────────
output "resource_group_name" {
  description = "The name of the created or imported resource group"
  value       = azurerm_resource_group.rg.name
}
