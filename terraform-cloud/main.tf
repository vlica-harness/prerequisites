terraform {
  cloud {
    organization = "harness-dev"

    workspaces {
      name = "vl_local_tf_cloud_1"
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
