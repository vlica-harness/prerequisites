resource "aws_instance" "my_aws_instance_vl" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

provider "aws" {
  access_key = var.accessKey
  secret_key = var.secretKey
  region     = "us-east-1"
  token      = var.token
}
