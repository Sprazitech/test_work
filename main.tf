# module "ec2" {
#     source = "./modules/ec2"
#     instance_name = "test_instance"
#     instance_type = "t2.micro"
#     ami_id = "ami-050fd9796aa387c0d"
# }


# # S3_static for web

# module "s3_static" {
#   source           = "./modules/s3_static"
#   project_prefix = var.project_prefix
#   bucket_name      = var.bucket_name
#   ENV              = var.ENV
  
  
# }


# module "cloudfront" {
#   source        = "./modules/cloudfront"
#   bucket_name   = module.s3_static.bucket_name
#   bucket_arn    = module.s3_static.bucket_arn
#   bucket_domain = module.s3_static.bucket_regional_domain
#   project_prefix = var.project_prefix

  

# }
