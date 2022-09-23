terraform {
  cloud {
    organization = "personal-testing-terraform"

    workspaces {
      name = "terraform-lambda-alias-versioning"
    }
  }
}

# AWS Provider
provider "aws" {}


module "configuration" {
  source      = "./lambda/configuration"
}