variable "kms_data_key_reuse_period_seconds" {
  type        = number
  description = "The length of time that SQS may use a cached data key before calling KMS again. Lower this value to force more frequent KMS check-ins."
  default     = 300
}

variable "common_tags" {
  type        = map(any)
  description = "Implements a common tagging scheme, attached to all resources that support tags"
  default     = {
    deployment = "terraform"
    vendor     = "bridgecrew"
  }
}

variable "api_token" {
  type        = string
  description = "Bridgecrew Platform API key"
}

variable "aws_profile" {
  type        = string
  description = "The name of the local AWS profile to use to invoke the AWS CLI to send an SNS notification to Bridgecrew. Omit to use the default profile or local environment variables."
  default     = null
}

