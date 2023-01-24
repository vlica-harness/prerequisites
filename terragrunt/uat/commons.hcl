locals {
    common_vars = read_terragrunt_config(find_in_parent_folders("commons.hcl"))
}

inputs = merge(
    local.common_vars.inputs,
    {
        env = "uat"
        subscription_id = "12d2db62-5aa9-471d-84bb-faa489b3e319"
        rgname = "vl-test-rc-azure-uat"
    }
)
