resource "aws_iam_role_policy" "RemediationFunctionRolePolicy0" {
  name   = "RemediationFunctionRolePolicy0"
  role   = aws_iam_role.RemediationFunctionRole.name
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "SQS:ReceiveMessage",
                "SQS:DeleteMessage",
                "SQS:GetQueueAttributes",
                "SQS:SetQueueAttributes"
            ],
            "Resource": [
                "${aws_sqs_queue.InboundRemediations.arn}"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ssm:GetParameter"
            ],
            "Resource": [
                "${aws_ssm_parameter.api-token.arn}"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "SNS:Publish"
            ],
            "Resource": "${local.sns_topic_arn}",
            "Effect": "Allow"
        },
        {
            "Action": [
                "iam:DeleteUser",
                "iam:DeleteRole",
                "iam:DeleteGroup",
                "iam:RemoveUserFromGroup",
                "iam:DeleteLoginProfile",
                "iam:DeleteAccessKey",
                "iam:DetachUserPolicy",
                "iam:DetachRolePolicy",
                "iam:DetachGroupPolicy",
                "iam:DeleteUserPolicy",
                "iam:DeleteRolePolicy",
                "iam:DeleteGroupPolicy"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": "lambda:UpdateFunctionCode",
            "Resource": "${aws_lambda_function.BridgecrewRemoteRemediation.arn}",
            "Effect": "Allow"
        },
        {
            "Action": [
                "iam:PutRolePolicy",
                "iam:PassRole"
            ],
            "Resource": "arn:aws:iam::${local.account_id}:role/*RemediationFunctionRole*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "cloudtrail:CreateTrail",
                "cloudtrail:StartLogging",
                "cloudtrail:UpdateTrail",
                "cloudwatch:PutMetricAlarm",
                "config:DeleteConfigurationRecorder",
                "config:DeleteDeliveryChannel",
                "config:PutConfigurationRecorder",
                "config:PutDeliveryChannel",
                "config:StartConfigurationRecorder",
                "config:StopConfigurationRecorder",
                "ec2:AssociateIamInstanceProfile",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateFlowLogs",
                "ec2:CreateSnapshot",
                "ec2:CreateTags",
                "ec2:DescribeSubnets",
                "ec2:DeleteInternetGateway",
                "ec2:DeleteVpc",
                "ec2:DeleteSubnet",
                "ec2:DescribeInternetGateways",
                "ec2:DeleteInternetGateway",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteVolume",
                "ec2:DescribeAddresses",
                "ec2:DescribeInstances",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeRegions",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeVpcEndpoints",
                "ec2:DescribeVolumes",
                "ec2:DetachInternetGateway",
                "ec2:DisassociateAddress",
                "ec2:ModifyInstanceAttribute",
                "ec2:MonitorInstances",
                "ec2:ReleaseAddress",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:StopInstances",
                "elasticloadbalancing:DescribeLoadBalancers",
                "iam:CreateRole",
                "iam:DeleteLoginProfile",
                "iam:GetAccessKeyLastUsed",
                "iam:GetAccountPasswordPolicy",
                "iam:GetPolicy",
                "iam:GetRole",
                "iam:GetUser",
                "iam:ListAccessKeys",
                "iam:UpdateAccessKey",
                "iam:UpdateAccountPasswordPolicy",
                "iam:UpdateLoginProfile",
                "kms:DisableKeyRotation",
                "kms:EnableKeyRotation",
                "kms:GetKeyRotationStatus",
                "lambda:GetFunctionConfiguration",
                "lambda:UpdateFunctionConfiguration",
                "logs:CreateLogGroup",
                "logs:PutMetricFilter",
                "rds:DescribeDBSecurityGroups",
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:DeleteBucketPolicy",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation",
                "s3:GetBucketLogging",
                "s3:GetBucketPolicy",
                "s3:GetEncryptionConfiguration",
                "s3:ListBucket",
                "s3:PutBucketAcl",
                "s3:PutBucketLogging",
                "s3:PutBucketPolicy",
                "s3:PutBucketVersioning",
                "s3:PutEncryptionConfiguration",
                "s3:PutObject",
                "sts:AssumeRole",
                "sts:GetCallerIdentity",
                "xray:PutTraceSegments",
                "ecr:PutImageScanningConfiguration"
            ],
            "Resource": "*",
            "Effect": "Allow",
            "Sid": "BridgecrewRemediation"
        },
        {
            "Condition": {
                "ArnLike": {
                    "iam:PolicyARN": "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
                }
            },
            "Action": [
                "iam:DetachRolePolicy",
                "iam:AttachRolePolicy"
            ],
            "Resource": "*",
            "Effect": "Allow",
            "Sid": "VisualEditor0"
        },
        {
            "Condition": {
                "ArnLike": {
                    "iam:PolicyARN": "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
                }
            },
            "Action": [
                "iam:DetachRolePolicy",
                "iam:AttachRolePolicy"
            ],
            "Resource": "arn:aws:iam::*:role/AWSConfigRole",
            "Effect": "Allow",
            "Sid": "VisualEditor1"
        },
        {
            "Action": "iam:PassRole",
            "Resource": "arn:aws:iam::${local.account_id}:role/AWSConfigRole",
            "Effect": "Allow",
            "Sid": "VisualEditor3"
        }
    ]
}
POLICY
}
