provider "aws" {
  region = var.aws_region
}

resource "aws_customer_gateway" "example" {
  bgp_asn    = 65000
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"
}

resource "aws_vpn_gateway" "example" {
  vpc_id = "your_vpc_id"
}

resource "aws_vpn_connection" "example" {
  customer_gateway_id = aws_customer_gateway.example.id
  vpn_gateway_id      = aws_vpn_gateway.example.id

  static_routes_only = false

  tunnel1 {
    pre_shared_key = "your_pre_shared_key1"
  }

  tunnel2 {
    pre_shared_key = "your_pre_shared_key2"
  }
}
