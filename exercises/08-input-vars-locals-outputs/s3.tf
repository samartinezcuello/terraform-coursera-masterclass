resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "project_bucket" {
  bucket = "${local.project}-${local.project_owner}-${random_id.bucket_suffix.hex}"

  tags = merge(local.common_tags, var.additional_tags)
}