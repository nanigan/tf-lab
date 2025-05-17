
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
# Resource Group Definition
# ─────────────────────────────────────────────
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ─────────────────────────────────────────────
# Outputs (Used in CI/CD or for reference)
# ─────────────────────────────────────────────
output "resource_group_name" {
  description = "The name of the created or imported resource group"
  value       = azurerm_resource_group.rg.name
}
