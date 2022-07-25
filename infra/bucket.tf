resource "aws_s3_bucket" "web-bucket" {
  bucket = "test-infra-bucket-austin-1"
}
resource "aws_s3_bucket_policy" "s3-get-policy" {
  bucket = aws_s3_bucket.test-tf-bucket.id
  policy = data.aws_iam_policy_document.get-object-policy.json
}

data "aws_iam_policy_document" "get-object-policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["460627244109"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.test-tf-bucket.arn,
      "${aws_s3_bucket.test-tf-bucket.arn}/*",
    ]
  }
}
