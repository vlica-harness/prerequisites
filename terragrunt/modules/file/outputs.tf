output "file_name_id" {
  value = local_file.hello_from_env.id
}

output "file_name_content" {
  value = local_file.hello_from_env.content
}
