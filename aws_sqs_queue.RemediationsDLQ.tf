resource "aws_sqs_queue" "RemediationsDLQ" {
  #checkov:skip=CKV_AWS_27: "Ensure all data stored in the SQS queue is encrypted"
  fifo_queue                        = local.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  name                              = local.queue_name
  tags                              = var.common_tags
}
