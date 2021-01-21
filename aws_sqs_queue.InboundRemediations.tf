resource "aws_sqs_queue" "InboundRemediations" {
  #checkov:skip=CKV_AWS_27: "Ensure all data stored in the SQS queue is encrypted"
  name                              = local.inbound_queue_name
  fifo_queue                        = local.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  redrive_policy = jsonencode(
    {
      deadLetterTargetArn = aws_sqs_queue.RemediationsDLQ.arn
      maxReceiveCount     = 5
    }
  )

  visibility_timeout_seconds = 1200
  tags                       = var.common_tags
}
