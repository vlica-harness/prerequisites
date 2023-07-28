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
