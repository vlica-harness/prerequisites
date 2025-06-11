#terraform {
#  cloud {
#    organization = "harness-dev"
#    workspaces {
#      name = "vl_local_tf_cloud_1"
#    }
#  }
#}

#terraform {
#  backend "remote" {
#    hostname     = "app.terraform.io"
#    organization = "harness-dev"
#    workspaces {
#      prefix = "vl-workspace-"
#    }
#  }
#}

#terraform {
#    backend "remote" {
#        hostname = "harness.jfrog.io"
#        organization = "da-dev-tf-test"
#        workspaces {
#            prefix = "mypref-"
#        }
#    }
#}

variable "countt" {
  type = number
}

resource "null_resource" "example1" {
  count = var.countt
  provisioner "local-exec" {
    command = "echo vlvllvlvlvl"
  }
}


resource "local_file" "hello1" {
  content  = "Hello, Terraform"
  filename = "hello1.txt"
}
