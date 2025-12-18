resource "aws_instance" "my_aws_instance_vl" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  tags = {
    Name = var.name_tag
  }
}

provider "aws" {}
