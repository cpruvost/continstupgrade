variable "compartment_ocid" {
    description = "The OCI Compartment ocid"
    type        = string
}

variable "gateway_display_name" {
    description = "The OCI Gateway Name"
    type        = string
}

variable "gateway_endpoint_type" {
  description = "The OCI Gateway Type (Public or private)"
  type        = string  
  default = "PUBLIC"
}

variable "public_subnet_ocid" {
    description = "The OCI Public Subnet ocid"
    type        = string
}

resource "oci_apigateway_gateway" "test_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  endpoint_type  = var.gateway_endpoint_type
  subnet_id      = var.public_subnet_ocid
  display_name   = var.gateway_display_name
}

data "oci_apigateway_gateways" "test_gateways" {
  #Required
  compartment_id = var.compartment_ocid
}