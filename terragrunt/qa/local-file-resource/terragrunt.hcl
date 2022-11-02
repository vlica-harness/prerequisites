terraform {
  source = "../..//modules/noop"
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
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
  subscription_id = local.common_vars.inputs.subscription_id
}
EOF
}

remote_state {
  backend = "azurerm"
  config = {
    key = "${path_relative_to_include()}/terraform.tfstate"
    subscription_id = local.common_vars.inputs.subscription_id
  }
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
}

inputs = {
  count_of_null_resources = 3
  file_message = local.common_vars.inputs.env
}
