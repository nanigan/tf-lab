# Azure Authentication Variables
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
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
  default     = "rg-cummins-tf-lab"
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