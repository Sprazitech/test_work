terraform {
  backend "s3" {
    encrypt = true
    bucket  = "test2work0209bucket0209"
    key     = "backend.tf"
    region  = "us-east-1"
    # dynamodb_table = "testworklock"
  }
}