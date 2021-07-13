terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile="default"
  region = "us-east-2"
}

resource "aws_default_subnet" "default_az" {
  availability_zone = "us-east-2a"
}



resource "aws_instance" "ec2_instance" {
  ami           = "ami-0277b52859bac6f4b"
  instance_type = "t2.micro"

  subnet_id = aws_default_subnet.default_az.id
}
