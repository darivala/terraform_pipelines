terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.7"
  backend "s3" {
    bucket = "bucketdarivala"
    key    = "terraform/state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "${var.aws_region}"
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "inst-crtd-trfm"
  ami = "ami-0157af9aea2eef346"
  instance_type = "t2.micro"
  key_name      = "newkeypair"
  monitoring    = true
  subnet_id     = "subnet-05e495c84f06f9ab3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


