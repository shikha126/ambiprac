resource "aws_s3_bucket" "sit-psi-log-bucket" {
  bucket = "sit-psi-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "SIT-PSI-S3" {
  bucket = "sit-psi-s3-new-bucket"
  acl    = "private"

  tags = {
    Name        = "sit-psi-s3-new-bucket"
    Environment = "SIT"
  }
  
  versioning {
    enabled = true
  }
  logging {
    target_bucket = aws_s3_bucket.sit-psi-log-bucket.id
    target_prefix = "*"
  }

  
}