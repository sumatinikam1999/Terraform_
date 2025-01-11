terraform {
  backend "s3" {
    bucket = "sumatiibucket"
    dynamodb_table = "tables"
    encrypt = true
    key = "sumatibucket/terraform.tfstate"
    region = "us-east-1"
  }
}