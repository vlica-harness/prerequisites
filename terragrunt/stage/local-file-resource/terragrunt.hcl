terraform {
  source = "../..//modules/noop"
  #source = "github.com/vlica-harness/prerequisites//terragrunt/modules/noop"
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
  file_from_tg = "${get_terragrunt_dir()}/text_file_to_show.yml"
}

inputs = {
  count_of_null_resources = 3
  file_message = local.common_vars.inputs.env
  file_to_show = local.file_from_tg
}
