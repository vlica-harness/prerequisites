locals {
    common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
}

inputs = merge(
    local.common_vars.inputs,
    {
        env = "dev"
        subscription_id = "20d6a917-99fa-4b1b-9b2e-a3d624e9dcf0"
        rgname = "terragrunt-testing-vl-from-tg"
    }
)
