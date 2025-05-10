# Configure the Azure Provider
provider "azurerm" {
  features {}
}

# Configure Authentication (Using Federated Credentials)
provider "azurerm" {
  features {}

  tenant_id       = var.AZURE_TENANT_ID
  subscription_id = var.AZURE_SUBSCRIPTION_ID
  client_id       = var.AZURE_CLIENT_ID
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