provider "azurerm" {
  features {}
  use_oidc = true
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "key_vault" {
  source              = "../../modules/key-vault"
  key_vault_name      = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  environment         = var.environment
  tags                = var.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.tags
}