# Azure Authentication Variables
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default     = "742d51bd-901c-4bbe-baff-fc05a7073fd2"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "1f4db9dc-679c-4e26-bfe5-e7ceda3c87e3"
}

variable "client_id" {
  description = "Azure Client ID for authentication"
  type        = string
}

# Terraform Backend Storage Variables
variable "storage_account_name" {
  description = "The name of the Azure Storage Account for Terraform state"
  type        = string
  default     = "stgsnefftflab"
}

variable "container_name" {
  description = "The name of the Blob Storage container for Terraform state"
  type        = string
  default     = "tfstate"
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
  default     = "westus2"
}

variable "key" {
  description = "The name of the Terraform state file"
  type        = string
  default     = "terraform.tfstate"
}

# Resource Group Location
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "westus2"
}