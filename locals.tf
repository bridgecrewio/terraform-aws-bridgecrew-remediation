locals {
  # Bridgecrew account to receive notifications
  organization_id                    = "890234264427"
  sns_notify_topic                   = "handle-customer-actions"
  queue_name                         = "Bridgecrew-RemediationsDLQ.fifo"
  inbound_queue_name                 = "Bridgecrew-InboundRemediations.fifo"
  account_id                         = data.aws_caller_identity.current.account_id
  sns_topic_arn                      = "arn:aws:sns:${local.region}:${local.organization_id}:${local.sns_notify_topic}"
  region                             = data.aws_region.current.name
  role_name                          = "BridgecrewRemoteRemediationFunctionRole"
  queue_principal_arn                = "arn:aws:iam::${local.organization_id}:root"
  function_name                      = "BridgecrewRemoteRemediation"
  fifo_queue                         = true
  template_bucket                    = "bc-code-artifacts-${local.organization_id}-"
  lambda_zip_name                    = "prod/remediations_lambda_c5f16a2212411fd69a5c6a5fe37278617df82f5a.zip"
  outbound_remediations_endpoint     = "https://www.bridgecrew.cloud/api"
  template_version                   = "0.3.37"
  batch_size                         = 1
  runtime                            = "nodejs10.x"
  lambda_timeout                     = 900
  maximum_batching_window_in_seconds = 0
  profile_str                        = var.aws_profile != null ? "--profile ${var.aws_profile}" : ""
}
