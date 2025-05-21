# ─────────────────────────────────────────────
# Azure Authentication
# ─────────────────────────────────────────────
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
}

# ─────────────────────────────────────────────
# Terraform Backend Configuration (used in workflow only)
# ─────────────────────────────────────────────
variable "storage_account_name" {
  description = "Azure Storage Account name for storing Terraform state"
  type        = string
}

variable "container_name" {
  description = "Blob container name for Terraform state files"
  type        = string
}

variable "key" {
  description = "Key (filename) for the Terraform state file"
  type        = string
}

# ─────────────────────────────────────────────
# Environment Metadata
# ─────────────────────────────────────────────
variable "environment" {
  description = "Deployment environment (e.g., dev, test, prod)"
  type        = string
  default     = "test"
}

# ─────────────────────────────────────────────
# Resource Group Configuration
# ─────────────────────────────────────────────
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

# ─────────────────────────────────────────────
# Key Vault Configuration
# ─────────────────────────────────────────────
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

# ─────────────────────────────────────────────
# Tagging
# ─────────────────────────────────────────────
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)

  validation {
    condition = alltrue([
      contains(keys(var.tags), "environment"),
      contains(keys(var.tags), "appid"),
      contains(keys(var.tags), "bc"),
      contains(keys(var.tags), "rc"),
      contains(keys(var.tags), "bu"),
      contains(keys(var.tags), "techowner"),
      contains(keys(var.tags), "billingowner"),
      contains(keys(var.tags), "billtag"),
      contains(keys(var.tags), "cc")
    ])
    error_message = "The 'tags' map must include: environment, appid, bc, rc, bu, techowner, billingowner, billtag, and cc."
  }
}
