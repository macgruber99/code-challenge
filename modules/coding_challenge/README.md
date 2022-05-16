# Coding Challenge module
Terraform module which creates an S3 bucket and SNS topic to satisfy the requirements of a coding challenge.

## Usage
```hcl
module "coding_challenge" {
  source = "./modules/coding_challenge"

  bucket_name       = "a-uniquely-named-s3-bucket"
  topic_name        = "a-good-sns-topic-name"
  topic_subscribers = ["user1@example.com", "user2@example.com"]

  tags = {
    my_tag = "my-value"
  }
}
```

## S3 Bucket
This module creates an S3 bucket.

### Security
By default, the private canned ACL is used.  This can be overridden.

Since this is a coding challenge and I don't really know where it might be deployed for testing, I did not apply a policy to the S3 bucket.  Normally I would do this.

### Notifications
The module will send a notification to the specified SNS topic when an object is created in the bucket.

## SNS
This module creates an SNS topic for sending emails to users notifying them when objects have been created in the S3 bucket.  It also creates subscriptions to the SNS topic based on a list of email addresses passed into the module.

### Security
An access policy is created for the SNS topic.  This limits publishing to the topic to the S3 bucket created by this module.

## Requirements
|Name|Version |
|:---|:---| 
|terraform|>= 1.0.0|
|aws      |>= 4.0.0|

## Providers
|Name|Version|
|:---|:---| 
|aws |>= 4.0.0|

## Modules
No modules.

## Resources
|Name|Type|
|:---|:---|
|[aws_s3_bucket.upload_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)|resource|
|[aws_s3_bucket_acl.upload_bucket](https://registry.terraform.io/providers/hashicorp%20%20/aws/latest/docs/resources/s3_bucket_acl)|resource|
|[aws_s3_bucket_notification.upload_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification)|resource|
|[aws_sns_topic.upload_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic)|resource|
|[aws_sns_topic_policy.upload_notification](https://www.google.com/search?client=firefox-b-1-d&q=terraform+aws_sns_topic_policy)|resource|
|[aws_iam_policy_document.upload_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)|data source|
|[aws_sns_topic_subscription.upload_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription)|resource|

## Inputs
|Name|Description|Type|Default|Required|
|:---|:---|:---|:---|:---|
|acl|The canned ACL for the S3 bucket.|string|"private"|yes|
|bucket_name|The name of the S3 bucket.|string| |yes|
|tags|A map of tags to apply to AWS resources.|map(string)| |no|
|topic_name|The name of the SNS topic.|string| | yes|
|topic_subscribers|A list of email addresses to subscribe to the SNS topic.|list(string)| |yes|

## Outputs
|Name|Description|
|:---|:---|
|upload_bucket_name|The name of the S3 bucket.|
topic_arn|The name of the SNS topic.|

## Authors
This module was created by Erik Green.

## License
N/A