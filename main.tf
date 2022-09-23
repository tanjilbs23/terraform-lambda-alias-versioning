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


module "test_alias_versioning" {
  source = "./lambda/test_alias_versioning"
}