output "vpn_gateway_id" {
  value = aws_vpn_gateway.test_vpn_gateway.id
}

output "vpc_id" {
  value = aws_vpc.test_vpc.id
}

# Add any additional outputs you want to display here.
