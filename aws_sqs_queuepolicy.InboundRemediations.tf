resource "aws_sqs_queue_policy" "InboundRemediations" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "SQS:SendMessage"
          Effect = "Allow"
          Principal = {
            AWS = local.queue_principal_arn
          }
          Resource = aws_sqs_queue.InboundRemediations.arn
        },
      ]
      Version = "2008-10-17"
    }
  )
  queue_url = aws_sqs_queue.InboundRemediations.id
}
