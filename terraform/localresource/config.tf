variable "countt" {
  type = number
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
