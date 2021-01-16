resource "aws_lambda_function" "BridgecrewRemoteRemediation" {
  #checkov:skip=CKV_AWS_50: "X-ray tracing is enabled for Lambda"
  description   = "Remote remediation of Bridgecrew incidents"
  function_name = local.function_name
  role          = aws_iam_role.RemediationFunctionRole.arn
  handler       = "remediator/handler.handle"
  runtime       = var.runtime
  s3_bucket     = "${var.templateBucket}${local.region}"
  s3_key        = var.lambdaZipName
  timeout       = var.Lambda_timeout
  environment {
    variables = {
      "BC_API_TOKEN"                   = "/bridgecrew/api-token"
      "IS_LAMBDA"                      = "true"
      "OUTBOUND_REMEDIATIONS_ENDPOINT" = var.outboundRemediationsEndpoint
    }
  }

  tags = var.common_tags
}
