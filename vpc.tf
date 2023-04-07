resource "aws_vpc" "demo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Terraform-demo-vpc"
  }
}
resource "aws_subnet" "demo1" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Terraform-demo-subnet1"
  }
}
resource "aws_subnet" "demo2" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Terraform-demo-subnet2"
  }
}
resource "aws_subnet" "demo3" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.50.0/24"

  tags = {
    Name = "Terraform-demo-subnet3"
  }
}
resource "aws_subnet" "demo4" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.51.0/24"

  tags = {
    Name = "Terraform-demo-subnet4"
  }
}
resource "aws_internet_gateway" "massgw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "Terraform-demo-IGW"
  }
}
resource "aws_route_table" "Pu_RT" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.massgw.id
  }

  tags = {
    Name = "Terraform-demo-RT"
  }
}
resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.demo.id
  }
