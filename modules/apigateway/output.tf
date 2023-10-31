output "gateways" {
  #value = data.oci_apigateway_gateways.test_gateways
  value = oci_apigateway_gateway.test_gateway.ip_addresses
}

output "deployments" {
  #value = data.oci_apigateway_deployments.test_deployments
  value = oci_apigateway_deployment.test_deployment
}