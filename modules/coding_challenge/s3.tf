resource "aws_s3_bucket" "upload_bucket" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,   # user-provided tags
    local.tags, # module-specific tags
    {},         # resource-specific tags
  )
}

resource "aws_s3_bucket_acl" "upload_bucket" {
  bucket = aws_s3_bucket.upload_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_notification" "upload_bucket" {
  bucket = aws_s3_bucket.upload_bucket.id

  topic {
    topic_arn = aws_sns_topic.upload_notification.arn
    events    = ["s3:ObjectCreated:*"]
  }
}