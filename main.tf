terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.7"
}

provider "aws" {
  region = "${var.aws_region}"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "mohan-single-instance"
  ami = "ami-01760eea5c574eb86"
  instance_type = "t3.micro"
  key_name      = "Jenkins_Node"
  monitoring    = true
  subnet_id     = "subnet-0b5e66c13b3b46f86"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
