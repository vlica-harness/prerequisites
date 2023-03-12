variable "countt" {
  type = number
}

terraform {
  backend "azurerm" {
    key                  = "vlica-test/terraform.tfstate"
    subscription_id      = "12d2db62-5aa9-471d-84bb-faa489b3e319"
    resource_group_name  = "tfResourceGroup"
    storage_account_name = "vlicaterraformremoteback"
    container_name       = "vl-azure-test"
  }
}

resource "null_resource" "example" {
  count = var.countt
  provisioner "local-exec" {
    command = "echo testlocallocaltesttestlocallocaltest"
  }
}
