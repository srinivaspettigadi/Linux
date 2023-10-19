provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-subnet"
  }
}

resource "aws_customer_gateway" "my_customer_gateway" {
  type    = "ipsec.1"
  bgp_asn = 65500 # Replace with your own ASN
  ip_address = var.public_ip
 
  tags = {
    Name = "${var.vpc_name}-customer-gateway"
  }
}

resource "aws_vpn_gateway" "my_vpn_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.vpc_name}-vpn-gateway"
  }
}

resource "aws_vpn_connection" "my_vpn_connection" {
  customer_gateway_id = aws_customer_gateway.my_customer_gateway.id
  vpn_gateway_id     = aws_vpn_gateway.my_vpn_gateway.id
  type               = "ipsec.1"

  tags = {
    Name = "${var.vpc_name}-vpn-connection"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.vpc_name}-route-table"
  }
}

resource "aws_route" "my_vpn_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_vpn_gateway.my_vpn_gateway.id

  tags = {
    Name = "${var.vpc_name}-vpn-route"
  }
}
