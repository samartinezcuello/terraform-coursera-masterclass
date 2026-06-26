output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.project_bucket.bucket
  sensitive   = true
}

output "sensitive_var" {
  sensitive = true # We must set this to true since the variable is sensitive!
  value     = var.my_sensitive_value
}