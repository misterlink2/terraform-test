terraform {
  backend "s3" {
    bucket = "tf-backend-austin"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
resource "aws_s3_bucket" "test-tf-bucket" {
  bucket = "tf-backend-austin"
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test-tf-bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.test-tf-bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.test-tf-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
