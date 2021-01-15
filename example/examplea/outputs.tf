output "InboundRemediations" {
  value = module.remediations.InboundRemediations
}

output "RemediationsDLQ" {
  value = module.remediations.RemediationsDLQ
}

output "InboundRemediationsARN" {
  value       = module.remediations.InboundRemediationsARN
  description = "SQS ARN of inbound Bridgecrew remote remediations messages"
}

output "TemplateVersion" {
  value       = module.remediations.TemplateVersion
  description = "Deployed CF stack version"
}
