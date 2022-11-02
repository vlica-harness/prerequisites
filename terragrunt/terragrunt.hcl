locals {
  subscription_vars = read_terragrunt_config(find_in_parent_folders("subscription.hcl"))

  subscription_id = local.subscription_vars.locals.subscription_id
}

# Generate Azure providers
generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.36.0"
      }
    }
}

provider "azurerm" {
  features {}
  subscription_id = "${local.subscription_id}"
}
EOF
}

remote_state {
  backend = "azurerm"
  config = {
    key = "${path_relative_to_include()}/terraform.tfstate"
    subscription_id = "${local.subscription_id}"
    resource_group_name  = "tfResourceGroup"
    storage_account_name = "vlicaterraformremoteback"
    container_name       = "azure-backend"
  }
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
}

# export these env vars ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID
# or put them in -backend-config file as below
# client_id, client_secret, tenant_id
#version = ">2.46.0"
