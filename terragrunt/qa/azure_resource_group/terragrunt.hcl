terraform {
  source = "github.com/rkoosaar/terraform-azurerm-resource-group//."
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
}
EOF
}

remote_state {
  backend = "azurerm"
  config = {
    key = "qa/azure_resource_group/terraform.tfstate"
    subscription_id = local.common_vars.inputs.subscription_id
  }
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
}

inputs = {
       az_rg_name     = local.common_vars.inputs.rgname
       az_rg_location = "East US"
       az_tags = {
        Environment   = "test"
        CostCenter    = "test"
        ResourceOwner = "test"
        Project       = "test"
        Role          = "Resource Group"
  }
}
