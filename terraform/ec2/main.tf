#resource "aws_instance" "my_aws_instance_vl" {
#  ami           = var.ami_id
#  instance_type = var.instance_type
#  
#  tags = {
#    Name = var.name_tag
#  }
#}


resource "aws_secretsmanager_secret" "vl-entity1-secret" {
  name = "vl-entity1-secret"

  tags = {
    name = var.name_tag
  }
}

resource "aws_secretsmanager_secret_version" "vl-entity1-secret" {
  secret_id     = aws_secretsmanager_secret.vl-entity1-secret.id
  secret_string = "my-plain-text-secret" 
}

provider "aws" {}
