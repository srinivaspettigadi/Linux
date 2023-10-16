provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "test_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "test_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
}
resource "aws_customer_gateway" "test_customer_gateway" {
  type    = "ipsec.1"
  bgp_asn = 65500 # Replace with your own ASN
  ip_address = "0.0.0.0" # Use a placeholder for now
}

resource "aws_vpn_gateway" "test_vpn_gateway" {
  vpc_id = aws_vpc.test_vpc.id
}

resource "aws_vpn_connection" "test_vpn_connection" {
  customer_gateway_id = aws_customer_gateway.test_customer_gateway.id
  vpn_gateway_id     = aws_vpn_gateway.test_vpn_gateway.id
  type               = "ipsec.1"
}

resource "aws_route_table" "test_route_table" {
  vpc_id = aws_vpc.test_vpc.id
}

resource "aws_route" "test_vpn_route" {
  route_table_id         = aws_route_table.test_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_vpn_gateway.test_vpn_gateway.id
}
