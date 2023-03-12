locals {
  default_tags = {}
  all_tags     = merge(local.default_tags, var.az_tags)
}

# Resource Group

resource "azurerm_resource_group" "az-rg" {
  name     = var.az_rg_name
  location = var.az_rg_location

  tags = local.all_tags
}


provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    key                  = "vlica-test/terraform.tfstate"
    subscription_id      = "12d2db62-5aa9-471d-84bb-faa489b3e319"
    resource_group_name  = "tfResourceGroup"
    storage_account_name = "vlicaterraformremoteback"
    container_name       = "vl-azure-test"
  }
}
