resource "aws_iam_role" "RemediationFunctionRole" {
  name               = local.role_name
  assume_role_policy = data.aws_iam_policy_document.trust.json
  tags               = var.common_tags
}