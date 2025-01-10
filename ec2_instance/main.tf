provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.devops_key.key_name
}

resource "aws_key_pair" "devops_key" {
  key_name = "devops"
  public_key = file("~/.ssh/id_rsa.pub")
}

