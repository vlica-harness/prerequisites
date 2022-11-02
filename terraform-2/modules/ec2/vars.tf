variable "ami_id" {
  default = "ami-0b0ea68c435eb488d"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "accessKey" {
  type = string
}

variable "secretKey" {
  type = string
}

variable "token" {
  type = string
}
