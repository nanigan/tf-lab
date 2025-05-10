
# Configure Authentication (Using Federated Credentials)
provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
}

# Define the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Define Outputs (For Reference in GitHub Actions)
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}