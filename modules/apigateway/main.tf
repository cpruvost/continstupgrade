variable "compartment_ocid" {
    description = "The OCI Compartment ocid"
    type        = string
}

variable "gateway_display_name" {
    description = "The OCI Gateway Name"
    type        = string
    default     = "CI_GATEWAY"
}

variable "gateway_endpoint_type" {
  description = "The OCI Gateway Type (Public or private)"
  type        = string  
  default = "PUBLIC"
}

variable "api_public_subnet_ocid" {
    description = "The OCI API Public Subnet ocid"
    type        = string
}

variable "deployment_path_prefix" {
  description = "The OCI API Deployment Path"
  type        = string  
  default     = "/ci"
}

variable "deployment_specification_routes_backend_type" {
  description = "The OCI API Route Backend Type"
  type        = string  
  default     = "HTTP_BACKEND"
}

# variable "deployment_specification_routes_backend_url" {
#   description = "The OCI API Route Backend Url"
#   type        = string    
#   default     = "http://lb-ipaddressapi/${request.path[endpoints]}"
# }

variable "lb_ip_address" {
    description = "The OCI LB CI IP Address"
    type        = string
}

variable "deployment_specification_routes_methods" {
  description = "The OCI API Route Methods (GET, POST, ...)"
  type        = list
  default     = ["ANY"]
}

variable "deployment_specification_routes_path" {
  description = "The OCI API Route Path"
  type        = string  
  default = "/{endpoints}"
}

resource "oci_apigateway_gateway" "test_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  endpoint_type  = var.gateway_endpoint_type
  subnet_id      = var.api_public_subnet_ocid
  display_name   = var.gateway_display_name
}

data "oci_apigateway_gateways" "test_gateways" {
  #Required
  compartment_id = var.compartment_ocid
  display_name = var.gateway_display_name
}

resource "oci_apigateway_deployment" "test_deployment" {
  #Required
  compartment_id = var.compartment_ocid
  gateway_id     = oci_apigateway_gateway.test_gateway.id
  path_prefix    = var.deployment_path_prefix

  specification {
    routes {
      #Required
      backend {
        #Required
        type = var.deployment_specification_routes_backend_type
        #LB url
        #url  = var.deployment_specification_routes_backend_url
        url = "http://${var.lb_ip_address}/$${request.path[endpoints]}"
        is_ssl_verify_disabled = false
      }
      path = var.deployment_specification_routes_path
      methods = var.deployment_specification_routes_methods
    }
  }
}

data "oci_apigateway_deployments" "test_deployments" {
  #Required
  compartment_id = var.compartment_ocid

  #Optional
  gateway_id   = oci_apigateway_gateway.test_gateway.id
}