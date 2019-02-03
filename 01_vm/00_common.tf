provider "azurerm" {}

locals {
  vmlist = ["m1", "w1", "w2"]
}

variable "resource_location" {
  default = "japaneast"
}

/*
variable "custom_script_storage_account" {}
variable "custom_script_storage_access_key" {}
variable "custom_script_url" {}
*/

variable "env_label" {
  default = "Kube Work Env"
}
