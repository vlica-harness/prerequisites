terraform {
  source = "../..//modules/noop"
  #source = "github.com/vlica-harness/prerequisites//terragrunt/modules/noop"
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
}

inputs = {
  count_of_null_resources = 3
  file_message = local.common_vars.inputs.env
}
