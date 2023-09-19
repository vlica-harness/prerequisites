terraform {
  source = "../..//modules/noop"
  #source = "github.com/vlica-harness/prerequisites//terragrunt/modules/noop"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  count_of_null_resources = 3
  file_message = "traralalla"
}
