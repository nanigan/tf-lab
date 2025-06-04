variable "key_vault_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "sku_name" {
  type        = string
  default     = "standard"
}

variable "purge_protection_enabled" {
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  default     = 7
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}

variable "secret_permissions" {
  type        = list(string)
  default     = ["Get", "List", "Set", "Delete"]
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, test, prod)"
}