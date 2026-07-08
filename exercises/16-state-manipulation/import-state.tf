/* Two ways
1 - Import via CLI [terraform import aws_s3_bucket.remote_state "terraform-course-santiagomartinez-remote-backend"]
2 - Import via import block
*/

resource "aws_s3_bucket" "remote_state" {
  bucket = "terraform-course-santiagomartinez-remote-backend"


  tags = {
    ManagedBy = "Terraform"
    Lifecycle = "Critical"
  }
#   lifecycle {
#     prevent_destroy = true
#   }
}

import {
  to = aws_s3_bucket_public_access_block.remote_state
  id = "terraform-course-santiagomartinez-remote-backend"
}

resource "aws_s3_bucket_public_access_block" "remote_state" {
  bucket = aws_s3_bucket.remote_state.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
