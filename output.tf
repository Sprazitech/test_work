output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_name" {
  description = "The name of the S3 static bucket"
  value       = module.s3_static.bucket_name
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 static bucket"
  value       = module.s3_static.bucket_arn
}

output "cloudfront_distribution_domain" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront.cloudfront_domain_name
}
