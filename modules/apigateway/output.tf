output "gateways" {
  value = data.oci_apigateway_gateways.test_gateways
}

output "deployments" {
  value = data.oci_apigateway_deployments.test_deployments
}