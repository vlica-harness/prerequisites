provider "aws" {
  access_key = var.accessKey
  secret_key = var.secretKey
  region     = "us-east-1"
  token      = var.token
}

module "my_ec2" {
  source        = "../modules/ec2"
  ami_id        = ""
  instance_type = ""
}


module "myNoop" {
  source = "../modules/noop"
  countt = 3
}


resource "random_pet" "bucket_name" {
  length    = 4
  separator = "-"
  prefix    = "learning"
}
