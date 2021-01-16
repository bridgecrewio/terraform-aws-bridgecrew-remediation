resource "aws_ssm_parameter" "api-token" {
  name        = "/bridgecrew/api-token"
  description = "Bridgecrew's API Token"
  type        = "String"
  value       = var.api_token
  tags        = var.common_tags
}
