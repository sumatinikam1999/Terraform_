provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "pro" {
  key_name = "pro-key"
  public_key = file("~/.ssh/pro-key.pub")
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.aws_key_pair
    vpc_security_group_ids = [aws_security_group.websg.id]

  provisioner "file" {
    source = "./folder/hello.txt"
    destination = "/tmp/hello.txt"

      connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("~/.ssh/pro-key")

    }
  }

  provisioner "local-exec" {
    command = " echo 'Hello World!!' > output.txt "
  }
}

resource "aws_security_group" "websg" {
  name = "ssh"
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}