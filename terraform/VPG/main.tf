provider "aws" {
  region = var.aws_region
}

module "vgw" {
  source = "./terraform/aws/vgw"
  vpc_id = var.vpc_id
  # Add other variables required by your VGW module
}
