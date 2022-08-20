data "aws_iam_policy_document" "allow_get_object" {
  statement {
    sid       = "AddPerm"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_hosting.arn}/*"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}