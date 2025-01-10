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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG/E5qfnIj9t2NajPb1KhTq5wuFKPH6lz0pGX8nfKkm4tJm7y2rPVKk2gLFwg6I7e99KH8e6SuAy4mIl2+YTUJWGK6pupgodvbjgSe2grvkJ1qiZlmFI+gSK/U2fa/Ycsxp2/XBoKXnYJfXO/tvKYDtBQaqbsK3FhJzKQ4YUZsxWfjPgwwFRy1faflyitOTQz+gn9XOF0lmp9xxg5isYZLV1FD2744k8grKP/alkTM4hln76CxknEhc6APLt7MOtZ1R0qOOYCQThNREgpNgAR0HsrpfAQplbwXOZoogo8jeaq9/qSMls0mBG6C6gIKhLxolGEzOGXOmJwjMNLH57bb"
}

