output "vpn_gateway_id" {
  value = aws_vpn_gateway.example_vpn_gateway.id
}

output "vpc_id" {
  value = aws_vpc.example_vpc.id
}

# Add any additional outputs you want to display here.
