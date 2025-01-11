provider "aws" {
  region = "us-east-1"
}

module "new" {
  source = "./modules/ec2_instance"
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
}