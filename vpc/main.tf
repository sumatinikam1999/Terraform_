terraform {
  required_providers {
    aws = {
    source = "hashicorp/aws"
    version = "~> 5"
          }
    }
}  

provider "aws" {
region = "us-east-1"
}

resource "aws_vpc" "vpc_name" {
cidr_block = "10.0.0.0/16"

tags = {
Name = "myvpc"
}
}

resource "aws_subnet" "net" {
vpc_id = aws_vpc.vpc_name.id
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_name.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc_name.id
  route  {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.net.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "web" {
  name   = "wegsg"
  vpc_id = aws_vpc.vpc_name.id

  ingress {
    description   = "HTTP"
    from_port     = 80
    to_port       = 80
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  ingress {
    description   = "SSH"
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}


resource "aws_instance" "example" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.web.id]
    subnet_id = aws_subnet.net.id
    user_data = base64encode(file("userdata.sh"))
}