/* Two ways
1 - Import via CLI [terraform state rm aws_s3_bucket.my_bucket]
2 - Import via remove block
*/
# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "random-name-1230o13491afaf310ra"
# }

removed {
  from = aws_s3_bucket.my_new_bucket
  lifecycle {
    destroy = false // true delete resource from AWS
  }
}

# resource "aws_s3_bucket" "my_new_bucket" {
#   bucket = "random-name-1230o13491afaf310ra"
# }