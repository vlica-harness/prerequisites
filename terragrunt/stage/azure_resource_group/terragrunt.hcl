terraform {
  #source = "../..//modules/azure-resource-group-local"
  #source = "git@github.com:rkoosaar/terraform-azurerm-resource-group.git//." # this is ssh also
  #source = "git::git@github.com:rkoosaar/terraform-azurerm-resource-group.git//."  # this is ssh also
  #source = "git::https://github.com/rkoosaar/terraform-azurerm-resource-group.git//."
  source = "github.com/rkoosaar/terraform-azurerm-resource-group//."  #no need of credentials it's http
}


include {
  path = find_in_parent_folders()
}

inputs = {
       az_rg_name     = "terragrunt-testing-vl-from-tg"
       az_rg_location = "East US"
       az_tags = {
        Environment   = "test"
        CostCenter    = "test"
        ResourceOwner = "test"
        Project       = "test"
        Role          = "Resource Group"
  }
}
