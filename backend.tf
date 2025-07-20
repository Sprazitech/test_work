terraform {
  backend "s3" {
    encrypt = true
    bucket  = "work02testbucket0202"
    key     = "backend.tf"
    region  = "us-east-1"
    # dynamodb_table = "testworklock"
  }
}