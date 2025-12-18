variable "ami_id" {
  default = "ami-0b0ea68c435eb488d"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "name_tag" {
  description = "Value for the EC2 Name tag"
  type        = string
}
