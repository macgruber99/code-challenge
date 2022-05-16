variable "acl" {
  default     = "private"
  description = "The ACL to apply to the S3 bucket."
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string

  # S3 bucket naming rules can be found here:
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  validation {
    condition     = var.bucket_name == regex("[a-z0-9.-]+", var.bucket_name)
    error_message = "The S3 bucket name contains invalid characters."
  }

  validation {
    condition     = length(var.bucket_name) > 2 && length(var.bucket_name) < 64
    error_message = "The S3 bucket name is too long."
  }

  validation {
    condition     = length(regexall("^[a-z0-9][a-z0-9.-]+[a-z0-9]$", var.bucket_name)) > 0
    error_message = "S3 bucket names must begin and end with a letter or number."
  }

  validation {
    condition     = length(regexall("^(?:[0-9]{1,3}.){3}[0-9]{1,3}$", var.bucket_name)) == 0
    error_message = "S3 bucket names must not be formatted as an IP address."
  }

  validation {
    condition     = length(regexall("^xn--", var.bucket_name)) == 0
    error_message = "S3 bucket names must not start with the prefix 'xn--'."
  }

  validation {
    condition     = length(regexall("-s3alias$", var.bucket_name)) == 0
    error_message = "S3 bucket names must not end with the suffix '-s3alias'."
  }
}

variable "tags" {
  default     = {}
  description = "Additional resource tags."
  type        = map(string)
}

variable "topic_name" {
  description = "The name of the SNS topic."
  type        = string

  # SNS topic names are limited to 256 characters. They can only contain alphanumeric characters,
  # hyphens (-) and underscores (_).  See: https://aws.amazon.com/sns/faqs/
  validation {
    condition     = var.topic_name == regex("[A-Za-z0-9.-_]+", var.topic_name)
    error_message = "The SNS topic name contains invalid characters."
  }

  validation {
    condition     = length(var.topic_name) > 0 && length(var.topic_name) < 257
    error_message = "The SNS topic name must be 256 characters or less."
  }
}

variable "topic_subscribers" {
  description = "A list of email addresses to subscribe to the SNS topic."
  type        = list(string)
}