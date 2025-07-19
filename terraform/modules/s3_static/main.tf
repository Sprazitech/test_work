resource "random_string" "bucket_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.project_prefix}-${random_string.bucket_suffix.result}"
  force_destroy = true

  tags = {
    Name = "${var.project_prefix}-static-website"
    ENV  = var.ENV
  }
}

output "bucket_name" {
  value = aws_s3_bucket.website.bucket
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
