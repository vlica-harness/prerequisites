resource "null_resource" "example" {
  count = var.count_of_null_resources

  provisioner "local-exec" {
    command = "echo ${module.fisierLocal.file_name_content}"
  }
}

module "fisierLocal" {
  source               = "../file"
  content_file_message = var.file_message
  file_to_display      = var.file_to_show
}
