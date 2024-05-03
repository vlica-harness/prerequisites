output "file_name_id" {
  value = local_file.hello_from_env.id
}

output "file_name_content" {
  value = local_file.hello_from_env.content
}


# output "example_file_content" {
#   value = file(var.file_to_display)
# }
