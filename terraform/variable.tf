variable "aws_region" {
  description = "AWS region where the resources will be created."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet."
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  default     = "us-east-1a"
}

variable "customer_gateway_asn" {
  description = "BGP ASN for the customer gateway."
  default     = 65000
}

variable "customer_gateway_ip" {
  description = "Public IP address of the customer gateway."
}

# Add any additional variables you need here.
