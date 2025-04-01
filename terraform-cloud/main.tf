#terraform {
#  cloud {
#    organization = "harness-dev"
#    workspaces {
#      name = "vl_local_tf_cloud_1"
#    }
#  }
#}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "harness-dev"
    workspaces {
      name = "vl-prerequisites-cloud-run-1"
    }
  }
}

# Define AWS provider
provider "aws" {
  region = "us-east-1"  # Replace with the AWS region where you want the EC2 instance
}


variable "countt" {
  type = number
}

resource "null_resource" "example1" {
  count = var.countt
  provisioner "local-exec" {
    command = "echo vlvllvlvlvl"
  }
}


#resource "local_file" "hello1" {
#  content  = "Hello, Terraform"
#  filename = "hello1.txt"
#}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-071226ecf16aa7d96"  # Replace with the appropriate AMI ID for your region
  instance_type = "t2.micro"  # Choose an instance type according to your needs

  tags = {
    Name = "vl-refresh-approval"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > /var/www/html/index.html
              EOF
}