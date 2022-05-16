resource "aws_sns_topic" "upload_notification" {
  name = var.topic_name

  tags = local.tags
}

resource "aws_sns_topic_policy" "upload_notification" {
  arn = aws_sns_topic.upload_notification.arn

  policy = data.aws_iam_policy_document.upload_topic.json
}

data "aws_iam_policy_document" "upload_topic" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    resources = [aws_sns_topic.upload_notification.arn]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.upload_bucket.arn]
    }
  }
}

resource "aws_sns_topic_subscription" "upload_topic" {
  count = length(var.topic_subscribers)

  topic_arn = aws_sns_topic.upload_notification.arn
  protocol  = "email"
  endpoint  = var.topic_subscribers[count.index]
}