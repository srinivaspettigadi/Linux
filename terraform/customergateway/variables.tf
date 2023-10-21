variable "region" {
  description = "AWS region"
  type        = string
}

variable "type" {
  description = "Customer Gateway type (e.g., ipsec.1)"
  type        = string
}

variable "public_ip" {
  description = "Public IP address of the customer gateway"
  type        = string
}

variable "bgp_asn" {
  description = "BGP ASN for the customer gateway"
  type        = number
}
