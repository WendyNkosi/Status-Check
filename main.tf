resource "aws_s3_bucket" "example" {
  bucket = "test-bucket"

  tags = {
    Name        = "Wendy's Test"
    Environment = "Dev"
  }
}
