locals {
  default_tags = {}
  all_tags     = merge(local.default_tags, var.az_tags)
}

# Resource Group

terraform {
  backend "azurerm" {
    key                  = "vlica-test/terraform.tfstate"
    subscription_id      = "20d6a917-99fa-4b1b-9b2e-a3d624e9dcf0"
    resource_group_name  = "terragrunt-testing-vl"
    storage_account_name = "vlterragruntstoragetest"
    container_name       = "vl-terragrunt-testing"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az-rg" {
  name     = var.az_rg_name
  location = var.az_rg_location

  tags = local.all_tags
}
