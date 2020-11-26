terraform {
  backend "s3" {
    bucket = "jagjot-s3-bucket-demo-1"
    key = "new_code"
    region = "us-east-1"
  }
}
