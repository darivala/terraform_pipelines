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
  name = "inst-crtd-terraform"
  ami = "ami-0157af9aea2eef346"
  instance_type = "t2.micro"
  key_name      = "newkeypair"
  monitoring    = true
  subnet_id     = "subnet-0a71a8a94e71396af"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
