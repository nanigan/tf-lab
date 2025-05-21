storage_account_name = "stgsnefftflab"
container_name       = "tfstate"
key                  = "test/terraform.tfstate"
resource_group_name  = "rg-cummins-tf-lab"
location             = "westus2"
environment          = "test"
key_vault_name       = "sneffkvtflab2"

tags = {
  environment     = "test"
  appid           = "20099"
  bc              = "598"
  rc              = "143"
  bu              = "cbs"
  techowner       = "it069"
  billingowner    = "Low"
  billtag         = "rg"
  cc              = "na"
}