resource "aws_s3_bucket" "this" {
  bucket = "${var.environment_name}-${var.bucket_prefix}"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "${var.environment_name}-data-bucket"
  }
}
