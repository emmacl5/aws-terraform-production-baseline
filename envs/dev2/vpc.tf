terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "Demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "Demo_vpc"
    ManagedBy = "terraform"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.Demo_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.Demo_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "Migw" {
  vpc_id = aws_vpc.Demo_vpc.id

  tags = {
    Name = "Myigw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.Demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Migw.id
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id

}
