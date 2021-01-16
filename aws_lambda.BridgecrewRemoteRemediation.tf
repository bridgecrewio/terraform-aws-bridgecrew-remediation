resource "aws_lambda_function" "BridgecrewRemoteRemediation" {
  #checkov:skip=CKV_AWS_50: "X-ray tracing is enabled for Lambda"
  description   = "Remote remediation of Bridgecrew incidents"
  function_name = local.function_name
  role          = aws_iam_role.RemediationFunctionRole.arn
  handler       = "remediator/handler.handle"
  runtime       = local.runtime
  s3_bucket     = "${local.template_bucket}${local.region}"
  s3_key        = local.lambda_zip_name
  timeout       = local.lambda_timeout
  environment {
    variables = {
      "BC_API_TOKEN"                   = "/bridgecrew/api-token"
      "IS_LAMBDA"                      = "true"
      "OUTBOUND_REMEDIATIONS_ENDPOINT" = local.outbound_remediations_endpoint
    }
  }

  tags = var.common_tags
}
