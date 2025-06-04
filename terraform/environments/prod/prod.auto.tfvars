location             = "eastus2"
environment          = "test"
resource_group_name   = "rg-cummins-tf-lab"

# Key Vault configuration
key_vault_name      = "sneffkvtflabprd"

# VNet configuration
vnet_name           = "prod-vnet"
vnet_address_space  = ["10.10.0.0/16"]

# Tag values for production environment
tags = {
  appid        = "20099"
  bc           = "598"
  billingowner = "ce974"
  billtag      = "rg"
  bu           = "cbs"
  cc           = "na"
  environment  = "prod"
  rc           = "143"
  techowner    = "it069"
}