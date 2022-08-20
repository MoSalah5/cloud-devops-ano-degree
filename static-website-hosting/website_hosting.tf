resource "aws_s3_bucket" "website_hosting" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_policy" "allow_get_object" {
  bucket = aws_s3_bucket.website_hosting.id
  policy = data.aws_iam_policy_document.allow_get_object.json
}

resource "aws_s3_bucket_website_configuration" "frontend_static_website" {
  bucket = aws_s3_bucket.website_hosting.bucket
  index_document {
    suffix = "index.html"
  }
}

# upload website content/files from its artifact to website hosting bucket
resource "null_resource" "upload_website_files" {
  depends_on = [
    aws_s3_bucket.website_hosting
  ]
  provisioner "local-exec" {
    command = "aws s3 sync s3://${var.source_bucket} s3://${var.bucket_name} --profile ${var.aws_profile_name}"
  }
}