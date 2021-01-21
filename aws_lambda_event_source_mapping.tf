resource "aws_lambda_event_source_mapping" "InboundRemediationsMapping" {
  event_source_arn                   = aws_sqs_queue.InboundRemediations.arn
  function_name                      = local.function_name
  batch_size                         = local.batch_size
  maximum_batching_window_in_seconds = local.maximum_batching_window_in_seconds
}
