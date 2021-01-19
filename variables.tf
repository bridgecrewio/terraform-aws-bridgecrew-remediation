variable "kms_data_key_reuse_period_seconds" {
  type    = number
  default = 300
}

variable "common_tags" {
  type        = map(any)
  description = "Implements a common tagging scheme, attached to all resources that support tags"
  default     = {}
}

variable "fifo_queue" {
  description = "Is this queue fifo?"
  type        = bool
  default     = true
}

variable "api-token" {
  type        = string
  description = "Bridgecrew Platform API key"
  sensitive   = true
}

variable "organizationID" {
  type    = string
  default = "890234264427"
}

variable "templateBucket" {
  type        = string
  description = "Public bucket to get the Lambda zipped code from"
  default     = "bc-code-artifacts-890234264427-"
}

variable "lambdaZipName" {
  type        = string
  description = "The Object to get from the Bucket"
  default     = "prod/remediations_lambda_c5f16a2212411fd69a5c6a5fe37278617df82f5a.zip"
}

variable "outboundRemediationsEndpoint" {
  type    = string
  default = "https://www.bridgecrew.cloud/api"
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
  description = "Set the runtime for the Remediations Lambda"
  type        = string
  default     = "nodejs10.x"
}

variable "customer_name" {
  type        = string
  description = "Customer name identifier - e.g. Patreon, Bridgecrew"
}

variable "Lambda_timeout" {
  description = "Lambda execution timeout"
  type        = number
  default     = 900
}
