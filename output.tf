output "bucket_website_endpoint" {
  value       = aws_s3_bucket_website_configuration.frontend_static_website.website_endpoint
  description = "The value of bucket website endpoint"
}