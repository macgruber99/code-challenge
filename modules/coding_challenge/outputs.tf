output "upload_bucket_name" {
  value = aws_s3_bucket.upload_bucket.id
}

output "topic_arn" {
  value = aws_sns_topic.upload_notification.arn
}