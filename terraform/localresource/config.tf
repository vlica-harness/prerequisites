variable "swag_file" {
}


resource "local_file" "rendered_config" {
  filename = "output_config.conf" # Output file

  # Use the templatefile function to populate the content
  content = templatefile(var.swag_file, {})
}