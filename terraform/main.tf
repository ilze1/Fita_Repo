terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {
    # Replace this with your bucket name!
    bucket         = "maris-test-s3-bucket"
    key            = "tfstate/terraform.tfstate"
    region         = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_id = vpc-0f488eb699cfd3961
}

module "EC2_Private" {
  source      = "./modules/instance_Private"
  subnet_id = module.vpc.private_sub_id
  private_sec_group = module.vpc.private_sec_group_id
}

module "EC2_Public" {
  source      = "./modules/instance_Public"
  subnet_id = module.vpc.public_sub_id
  public_sec_group = module.vpc.public_sec_group_id
}