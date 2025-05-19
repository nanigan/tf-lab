
# Azure Authentication
variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID used for federated authentication"
  type        = string
  sensitive   = true
}

# Terraform Backend Configuration
variable "storage_account_name" {
  description = "Azure Storage Account name for storing Terraform state"
  type        = string
}

variable "container_name" {
  description = "Blob container name for Terraform state files"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

variable "key" {
  description = "Key (filename) for the Terraform state file"
  type        = string
  default     = "test/terraform.tfstate"
}

# Resource Group Configuration
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}
