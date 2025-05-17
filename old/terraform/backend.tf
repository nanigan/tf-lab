terraform {
  backend "azurerm" {
    use_azuread_auth      = true
    storage_account_name  = "stgsnefftflab"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
    resource_group_name   = "rg-cummins-tf-lab"
  }
}