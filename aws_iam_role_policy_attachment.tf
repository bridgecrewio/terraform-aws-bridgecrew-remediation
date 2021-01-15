
resource "aws_iam_role_policy_attachment" "ViewOnlyAccess" {
  role       = aws_iam_role.RemediationFunctionRole.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "SecurityAudit" {
  role       = aws_iam_role.RemediationFunctionRole.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_iam_role_policy_attachment" "AWSLambdaSQSQueueExecutionRole" {
  role       = aws_iam_role.RemediationFunctionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
}

resource "aws_iam_role_policy_attachment" "AWSLambdaBasicExecutionRole" {
  role       = aws_iam_role.RemediationFunctionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}