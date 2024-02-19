variable "BASE_DIR" {
  type = string
}

variable "SCRIPT_DIR" {
  type = string
}

output "base_dir" {
  value = var.BASE_DIRR
}

output "script_dir" {
  value = var.SCRIPT_DIRR
}
