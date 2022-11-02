
resource "local_file" "hello_from_env" {
  content  = "Hello, provision to env: ${var.content_file_message}"
  filename = "${path.module}/helloFromEnv.txt"
}
