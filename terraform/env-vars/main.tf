variable "BASE_DIRR" {
  type = string
}

variable "SCRIPT_DIRR" {
  type = string
}

output "base_dir" {
  value = var.BASE_DIRR
}

output "script_dir" {
  value = var.SCRIPT_DIRR
}
