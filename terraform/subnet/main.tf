variable "vpc_id" {
  description = "ID of the existing VPC"
}

resource "aws_subnet" "rap1_subnet_tf" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.30.200.0/24"
  availability_zone       = "us-east-2a"  # Adjust the AZ as needed
  map_public_ip_on_launch = true
}

resource "aws_subnet" "wap1_subnet_tf" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.30.50.0/24"
  availability_zone       = "us-east-2b"  # Adjust the AZ as needed
  map_public_ip_on_launch = true
}
