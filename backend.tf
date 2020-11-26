terraform {
  backend "s3" {
    bucket = "jagjot-s3-bucket-demo"
    key = "new_code"
    region = "us-east-1"
  }
}
