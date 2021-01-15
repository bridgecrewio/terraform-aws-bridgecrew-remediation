resource "aws_sqs_queue" "RemediationsDLQ" {
  fifo_queue                        = var.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  name                              = local.queue_name
  tags                              = var.common_tags
}
