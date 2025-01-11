variable "ami" {
  description = "AMI ID:"
  type = string
}

variable "instance_type" {
  description = "Instance type:"
  type = string
}

variable "aws_key_pair" {
  description = "key-pair"
  type = string
}