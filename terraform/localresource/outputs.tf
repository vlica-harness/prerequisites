output "TEST_OUTPUT_NAME1" {
  value = "test-output-value1"
}

output "test-output-name2" {
  value = "test-output-value2"
}

output "instance_type" {
  value = "t2.small"
}



output "hostInstancesss" {
  value = [
    {
      region    = "region"
      hostname  = "aws_instance.example.public_dns"
      privateIp = "aws_instance.example.private_ip"
      subnetId  = "aws_subnet.example.id"
    }
  ]
}
