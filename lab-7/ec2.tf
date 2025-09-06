terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
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

provider "aws" {}

resource "aws_instance" "vm" {
    ami = "ami-004cd0b750b0e2269"
    instance_type = "t4g.micro"
    key_name = "devops-victor"
  tags = {
    Name = "vm-victor"
  }
}