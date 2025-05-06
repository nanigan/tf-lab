terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-cummins-tf-lab"
    storage_account_name  = "stgsnefftflab"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
    use_azuread_auth      = true
  }
}

provider "azurerm" {
  features {}
  
client_id       = var.client_id
client_secret   = var.client_secret
subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

}

