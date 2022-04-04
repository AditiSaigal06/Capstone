# Below is the VPC Configuration to create VPC in AWS
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # VPC CONFIGURATION
  name            = "Myvpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    "kubernetes.io/cluster/my-eks-523" = "shared"
    Owner                                 = "Nikhil"
    Environment                           = "Course Project"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-523" = "shared"
    "kubernetes.io/role/elb"              = "1"
    Type                                  = "public-subnets"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-523" = "shared"
    "kubernetes.io/role/internal-elb"     = "1"
    Type                                  = "private-subnets"
  }


  # NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  create_igw = true
  vpc_tags = {
    Name = "Course VPC"
  }
}