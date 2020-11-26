provider "aws" {
  version = "3.18.0"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::197915863913:role/admin-access"
  }
}
