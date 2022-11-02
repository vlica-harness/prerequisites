terraform {
  #source = "../..//modules/azure-resource-group-local"
  source = "github.com/rkoosaar/terraform-azurerm-resource-group//."
}

locals {
    common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
}

include {
  path = find_in_parent_folders()
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
