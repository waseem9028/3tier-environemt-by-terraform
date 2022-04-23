resource "aws_vpc" "prod-vpc" {
  cidr_block           = "10.0.0.0/18"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.Name
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = var.Name
  }
}

# VPC subnet 1 in AZ 1
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.0.0/19"
  availability_zone       = var.av_zone_1[var.region]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "web-subnet-1"
  }
}

# VPC subnet 2 in AZ 2
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.32.0/19"
  availability_zone       = var.av_zone_2[var.region]
  map_public_ip_on_launch = "false"

  tags = {
    Name = "db-subnet-1"
  }
}

resource "aws_route_table" "web-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = var.Name
  }
}

resource "aws_route_table_association" "assoc1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.web-table.id
}

resource "aws_route_table_association" "assoc2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.web-table.id
}