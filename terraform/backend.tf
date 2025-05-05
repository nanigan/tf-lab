terraform {
  backend "azurerm" {
    resource_group_name   = "rg-cummins-tf-lab"
    storage_account_name  = "stgsnefftflab"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
