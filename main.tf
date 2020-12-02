provider "aws" {
  version = "3.18.0"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::348465476063:role/admin-access"
  }
}
