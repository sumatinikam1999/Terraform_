terraform {
  backend "s3" {
    bucket = "sumatibucket"
    key = "sumatibucket/terraform.state"
    dynamodb_table = "table"
    region = "us-east-1"
    encrypt = true
  }
}