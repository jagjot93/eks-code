terraform {
  backend "s3" {
    bucket = "jagjot-s3-bucket-demo-1"
    key = "eks.tfstate"
    region = "us-east-1"
  }
}
