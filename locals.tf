locals {
  queue_name          = "patreon-RemediationsDLQ.fifo"
  inbound_queue_name  = "patreon-InboundRemediations.fifo"
  account_id          = data.aws_caller_identity.current.account_id
  sns_topic_arn       = "arn:aws:sns:${local.region}:${var.organizationID}:${var.snsNotifyTopic}"
  region              = data.aws_region.current.name
  role_name           = "patreon-RemediationFunction"
  queue_principal_arn = "arn:aws:iam::${var.organizationID}:root"
  function_name       = "BridgecrewRemoteRemediation"
}
