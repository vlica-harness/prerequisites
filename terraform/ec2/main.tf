resource "aws_instance" "my_aws_instance_vl" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

provider "aws" {
  access_key = var.my_aws_access_key
  secret_key = var.my_aws_secret_key
  region     = "us-east-1"
}
