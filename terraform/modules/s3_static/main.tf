resource "aws_s3_bucket" "website" {
  bucket        = "${var.resources_prefix}-${var.bucket_name}"
  force_destroy = true

  tags = {
    Name = "Static Website"
    ENV  = var.ENV
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.website.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.website.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "config" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}
