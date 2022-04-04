variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

#S3 bucket name
variable "s3_bucket_name" {
  default = "nikhil-capstone-backend-tf"
}

#DynamoDB Table
variable "dynamodb_table_name" {
  default = "Nikhil_terraform_state"
}

# Availability Zones
variable "vpc_availability_zones" {
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

# Public Subnet
variable "vpc_public_subnets" {
  description = "Public Subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]

}

# Private Subnet
variable "vpc_private_subnets" {
  description = "Private Subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}


# VPC NAT Gateway is enabled
variable "vpc_enable_nat_gateway" {
  description = "NAT Gateway for Private Subnets"
  default     = true
}

# VPC Single NAT Gateway
variable "vpc_single_nat_gateway" {
  description = "NAT Gateway in one Availability Zone"
  default     = true
}
