locals {
  queue_name          = "${var.customer_name}-RemediationsDLQ.fifo"
  inbound_queue_name  = "${var.customer_name}-InboundRemediations.fifo"
  account_id          = data.aws_caller_identity.current.account_id
  sns_topic_arn       = "arn:aws:sns:${local.region}:${var.organizationID}:${var.snsNotifyTopic}"
  region              = data.aws_region.current.name
  role_name           = "${var.customer_name}-RemediationFunction"
  queue_principal_arn = "arn:aws:iam::${var.organizationID}:root"
  function_name       = "BridgecrewRemoteRemediation"
}
