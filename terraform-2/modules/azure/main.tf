provider "azurerm" {
  features {}
}

resource "null_resource" "example" {
  count = 5
  provisioner "local-exec" {
    command = "echo testlocallocaltesttestlocallocaltest"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">2.46.0"
    }
  }

  backend "azurerm" {}
}
