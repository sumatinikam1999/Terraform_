provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = "t2.micro"
}
/*
resource "aws_s3_bucket" "mybucket" {
  bucket = "sumatinewbucket"
}

resource "aws_dynamodb_table" "table" {
  name = "table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
*/