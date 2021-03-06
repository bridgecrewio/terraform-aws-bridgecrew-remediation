output "InboundRemediations" {
  value = aws_sqs_queue.InboundRemediations
}

output "RemediationsDLQ" {
  value = aws_sqs_queue.RemediationsDLQ
}

output "InboundRemediationsARN" {
  value       = aws_sqs_queue.InboundRemediations.arn
  description = "SQS ARN of inbound Bridgecrew remote remediations messages"
}

output "TemplateVersion" {
  value       = local.template_version
  description = "Deployed remediation stack version"
}
