variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "TF"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "172.30.0.0/16"
}
