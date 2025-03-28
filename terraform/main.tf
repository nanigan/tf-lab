terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform-lab"
    storage_account_name  = "sneffstgtf"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
