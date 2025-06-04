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
# VNet Configuration
# ─────────────────────────────────────────────
variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Azure Virtual Network"
  type        = list(string)
}

# ─────────────────────────────────────────────
# Tagging
# ─────────────────────────────────────────────
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)

  validation {
    condition = alltrue([
      contains(keys(var.tags), "appid"),
      contains(keys(var.tags), "bc"),
      contains(keys(var.tags), "billingowner"),
      contains(keys(var.tags), "billtag"),
      contains(keys(var.tags), "bu"),
      contains(keys(var.tags), "cc"),
      contains(keys(var.tags), "environment"),
      contains(keys(var.tags), "rc"),
      contains(keys(var.tags), "techowner")
    ])
    error_message = "The 'tags' map must include: environment, appid, bc, rc, bu, techowner, billingowner, billtag, and cc."
  }
}