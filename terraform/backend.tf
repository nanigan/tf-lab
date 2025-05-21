terraform {
  backend "azurerm" {
    resource_group_name   = "rg-cummins-tf-lab2-wh701"
    storage_account_name  = "sa01poc20099wh701"
    container_name        = "tfstate"
    key                   = "PLACEHOLDER"  # Will be overridden via CLI
    use_oidc              = true
  }
}
