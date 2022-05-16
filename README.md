# code-challenge
A repo containing code for a coding challenge.

# Modules
[coding_challenge](https://github.com/macgruber99/code-challenge/tree/master/modules/coding_challenge)

## Variables
|Name|Description|Type|Default|Required|
|:---|:---|:---|:---|:---|
|bucket_name|The name of the S3 bucket.|string| |yes|
|project|The name of this project.|string|yes|
|topic_name|The name of the SNS topic.|string| | yes|
|topic_subscribers|A list of email addresses to subscribe to the SNS topic.|list(string)| |yes|

## Outputs
|Name|Description|
|:---|:---|
|upload_bucket_name|The name of the S3 bucket.|
|topic_arn|The name of the SNS topic.|

## Authors
This project was created by Erik Green.

## License
N/A