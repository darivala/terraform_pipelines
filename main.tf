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


/*module "ec2_instance" {
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
*/
# ----- S3 BUCKET -----
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"
  acl    = "private"

  # Create this bucket only after EC2 instance is created
  #depends_on = [module.ec2_instance]   # Wait until EC2 is ready

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
