# Create a VPC
resource "aws_vpc" "vpc1" { #tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc1"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "internet_gateway_1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "internet-gateway-1"
  }
}

# Create a Route Table
resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_1.id
  }

  tags = {
    Name = "route-table-1"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "route_table_association_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table_1.id
}

# Create a Subnet
resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "subnet-1"
  }
}