#terraform {
#  cloud {
#    organization = "harness-dev"
#    workspaces {
#      name = "vl_local_tf_cloud_1"
#    }
#  }
#}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "harness-dev"
    workspaces {
      name = "vl-prerequisites-cloud-run-1"
    }
  }
}

variable "countt" {
  type = number
}

resource "null_resource" "example1" {
  count = var.countt
  provisioner "local-exec" {
    command = "echo vlvllvlvlvl"
  }
}
