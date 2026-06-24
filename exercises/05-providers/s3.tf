resource "aws_s3_bucket" "eu_west_1" {
  bucket = "example-bucket-eu-west-1-santiago-martinez"
  provider = aws.eu-west
}


resource "aws_s3_bucket" "us_east_1" {
  bucket = "example-bucket-us-east-1-santiago-martinez"
  provider = aws.us-east
}