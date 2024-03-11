output "TEST_OUTPUT_NAME1" {
  value = "test-out'put-value1"
}

output "test-output-name2" {
  value = "test-output-value2"
}

output "result" {
  value = {
    "region" : "us-east-1",
    "hostInstances" : [
      {
        "hostname" : "hostnamexxxx",
        "defaultIpAddress" : "defaultyyyyy"
      }
    ],
    "hostname" : "hostnamexxxx",
    "defaultIpAddress" : "defaultyyyyy"
  }
}
