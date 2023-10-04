variable "countt" {
  type    = number
  default = "2"
}

variable "counttt" {
  type    = number
  default = "4"
}

resource "null_resource" "example" {
  count = var.countt + var.counttt
  provisioner "local-exec" {
    command = "echo testlocallocaltesttestlocallocaltest"
  }
}

resource "local_file" "hello1" {
  content  = "Hello, Terraform"
  filename = "hello1.txt"
}
