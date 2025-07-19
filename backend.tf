terraform {
  backend "s3" {
    encrypt = true
    bucket  = "test34345bucket363"
    key     = "backend.tf"
    region  = "us-east-1"
    dynamodb_table = "testworklock"
  }
}