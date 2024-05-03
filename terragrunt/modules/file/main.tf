
resource "local_file" "hello_from_env" {
  content  = file(var.file_to_display)
  filename = "${path.module}/helloFromEnv.txt"
}
