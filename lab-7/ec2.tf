terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
terraform {
  cloud {
    organization = "terraformcloud-90"

    workspaces {
      name = "terraformcloud-90-workspace"
    }
  }
}

provider "aws" {
  region     = "eu-west-3"
}

resource "aws_instance" "vm" {
    ami = "ami-004cd0b750b0e2269"
    instance_type = "t4g.micro"
    key_name = "devops-victor"
  tags = {
    Name = "vm-victor"
  }
}