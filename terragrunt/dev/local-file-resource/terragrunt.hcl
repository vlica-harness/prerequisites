terraform {
  source = "../..//modules/noop"
}

include {
  path = find_in_parent_folders()
}

locals {
    common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
}

dependency "azure_rc_group_name" {
  config_path = "../azure_resource_group"
}

inputs = {
       count_of_null_resources = 2
       #file_message = local.common_vars.inputs.env
       file_message = dependency.azure_rc_group_name.outputs.az-rg-name
}


# What need to be deployed first (before this) useful for `terragrunt run-all apply`
dependencies {
  paths = ["../azure_resource_group"]
}
