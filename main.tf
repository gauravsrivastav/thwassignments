#create ec2 instance and insatll the packeages
#main.tf
terraform {
  required_providers {
	aws = {
	source = "hashicorp/aws"
	version = "~> 2.27"
	}
  }
}
provider "aws" {
	profile = "default"
	region = "${var.aws_region}"
}
