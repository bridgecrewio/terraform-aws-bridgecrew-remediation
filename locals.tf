locals {
  #queue_name         = "patreon-RemediationsDLQ-${random_string.random.result}.fifo"
  queue_name = "patreon-RemediationsDLQ-1DGKD4S9ORHFO.fifo"
  #inbound_queue_name = "patreon-InboundRemediations-${random_string.random.result}.fifo"
  inbound_queue_name = "patreon-InboundRemediations-13WM2ST22347Y.fifo"
  account_id         = data.aws_caller_identity.current.account_id
  sns_topic_arn      = "arn:aws:sns:${local.region}:${var.organizationID}:${var.snsNotifyTopic}"
  region             = data.aws_region.current.name
  role_name          = "patreon-RemediationFunctionRole-1WBHRVFHOJVLL"
  #role_name="patreon-RemediationFunctionRole-${random_string.random.result}"
  queue_principal_arn = "arn:aws:iam::${var.organizationID}:root"
  function_name       = "BridgecrewRemoteRemediation"
}
/*
resource "random_string" "random" {
  length  = 13
  special = false
}
*/

