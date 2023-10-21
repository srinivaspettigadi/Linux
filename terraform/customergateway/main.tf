provider "aws" {
  region = var.region
}

resource "aws_customer_gateway" "example" {
  type    = var.type
  bgp_asn = var.bgp_asn
  ip_address = var.public_ip
}
