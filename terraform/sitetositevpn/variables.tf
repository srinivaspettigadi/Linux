variable "aws_region" {
  description = "The AWS region where the VPN connection will be created."
  type        = string
}

variable "customer_gateway_ip" {
  description = "The IP address of the customer gateway."
  type        = string
}

# Add more variables as needed
