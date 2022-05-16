variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "project" {
  description = "The name of this project."
  type        = string
}

variable "topic_name" {
  description = "The name of the SNS topic."
  type        = string
}

variable "topic_subscribers" {
  description = "A list of email addresses to subscribe to the SNS topic."
  type        = list(string)
}