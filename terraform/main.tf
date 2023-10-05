provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "example_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_customer_gateway" "example_customer_gateway" {
  bgp_asn    = var.customer_gateway_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"
}

resource "aws_vpn_gateway" "example_vpn_gateway" {
  vpc_id = aws_vpc.example_vpc.id
}

resource "aws_vpn_connection" "example_vpn_connection" {
  customer_gateway_id = aws_customer_gateway.example_customer_gateway.id
  vpn_gateway_id     = aws_vpn_gateway.example_vpn_gateway.id
  type               = "ipsec.1"
}

resource "aws_route_table" "example_route_table" {
  vpc_id = aws_vpc.example_vpc.id
}

resource "aws_route" "example_vpn_route" {
  route_table_id         = aws_route_table.example_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_vpn_gateway.example_vpn_gateway.id
}
