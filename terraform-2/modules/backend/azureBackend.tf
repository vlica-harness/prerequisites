terraform {
  backend "azurerm" {
    resource_group_name  = "tfResourceGroup"
    storage_account_name = "vlicaterraformremoteback"
    container_name       = "azure-backend"
    key                  = "terraform.tfstate"
  }
}
