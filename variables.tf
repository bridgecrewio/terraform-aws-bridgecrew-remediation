variable "kms_data_key_reuse_period_seconds" {
  type    = number
  default = 300
}

variable "common_tags" {
  default = {}
}

variable "fifo_queue" {
  description = "Is queue fifo?"
  type        = bool
  default     = true
}

variable "api-token" {
  type      = string
  sensitive = true
}

variable "organizationID" {
  type    = string
  default = "890234264427"
}

variable "templateBucket" {
  type    = string
  default = "bc-code-artifacts-890234264427-"
}

variable "lambdaZipName" {
  type    = string
  default = "prod/remediations_lambda_c5f16a2212411fd69a5c6a5fe37278617df82f5a.zip"
}

variable "outboundRemediationsEndpoint" {
  type    = string
  default = "https://dfak3u9wq1.execute-api.us-west-2.amazonaws.com/v1"
}

variable "snsNotifyTopic" {
  type    = string
  default = "handle-customer-actions"
}

variable "templateVersion" {
  type    = string
  default = "0.3.37"
}

variable "batch_size" {
  type    = number
  default = 1
}

variable "maximum_batching_window_in_seconds" {
  type    = number
  default = 0
}

variable "runtime" {
  type=string
  default="nodejs10.x"
}