resource "aws_lambda_function" "BridgecrewRemoteRemediation" {
  description   = "Remote remediation of Bridgecrew incidents"
  function_name = local.function_name
  role          = aws_iam_role.RemediationFunctionRole.arn
  handler       = "remediator/handler.handle"
  runtime       = var.runtime
  s3_bucket     = "${var.templateBucket}${local.region}"
  s3_key        = var.lambdaZipName
  timeout       = 900
  environment {
    variables = {
      "BC_API_TOKEN"                   = "/bridgecrew/api-token"
      "IS_LAMBDA"                      = "true"
      "OUTBOUND_REMEDIATIONS_ENDPOINT" = var.outboundRemediationsEndpoint
    }
  }

  tags = var.common_tags
}

