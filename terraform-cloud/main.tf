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

terraform {  
  backend "remote" {}
}


#terraform {
#  backend "remote" {}
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

resource "github_repository_file" "foo" {
  repository          = "create_by_tf"
  branch              = "main"
  file                = "terraform_output_test_${terraform.workspace}.txt"
  content             = "tf3 - -- This is a test file created by Terraform!!"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "satendra.kumar@harness.io"
  overwrite_on_create = true
  autocreate_branch   = true
}
provider "github" {
  owner = "satendra-harness"
}
