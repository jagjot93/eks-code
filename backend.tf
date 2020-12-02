terraform {
  backend "s3" {
    bucket = "jagjot-s3-bucket-demo"
    key = "eks.tfstate"
    region = "us-east-1"
  }
}
