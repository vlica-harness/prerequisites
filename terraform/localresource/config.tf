variable "countt" {
  type    = number
  default = "2"
}

resource "null_resource" "example" {
  count = var.countt
  provisioner "local-exec" {
    command = "echo testlocallocaltesttestlocallocaltest"
  }
}

resource "local_file" "hello1" {
  content  = "Hello, Terraform"
  filename = "hello1.txt"
}

resource "local_file" "hello2" {
  content  = "Hello, Terraform"
  filename = "hello2.txt"
}

resource "local_file" "hello3" {
  content  = "Hello, Terraform"
  filename = "hello3.txt"
}
