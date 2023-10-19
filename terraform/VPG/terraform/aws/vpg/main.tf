resource "aws_vpn_gateway" "example" {
  vpc_id = var.vpc_id
}

output "vgw_id" {
  description = "ID of the VGW created."
  value = aws_vpn_gateway.example.id
}
