## Naming

Seems to be inconsistent naming with some object - lambda not having unique names

## IAM

I removed a section of the iam as it is only relevant if your using cf.

```Iam
{
            "Action": [
                "cloudformation:CreateChangeSet"
            ],
            "Resource": "arn:aws:cloudformation:us-east-2:aws:transform/*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "cloudformation:UpdateStack"
            ],
            "Resource": "${var.cf_update_path}",
            "Effect": "Allow"
        },
 
```

## Imports

For debugging:
```
terraform import aws_sqs_queue.RemediationsDLQ https://sqs.us-east-2.amazonaws.com/481212720429/patreon-RemediationsDLQ-1DGKD4S9ORHFO.fifo

terraform import aws_sqs_queue.InboundRemediations https://sqs.us-east-2.amazonaws.com/481212720429/patreon-InboundRemediations-13WM2ST22347Y.fifo

terraform import aws_iam_role.RemediationFunctionRole patreon-RemediationFunctionRole-1WBHRVFHOJVLL

terraform import aws_iam_role_policy.RemediationFunctionRolePolicy0 patreon-RemediationFunctionRole-1WBHRVFHOJVLL:RemediationFunctionRolePolicy0

terraform import aws_iam_role_policy_attachment.ViewOnlyAccess patreon-RemediationFunctionRole-1WBHRVFHOJVLL/arn:aws:iam::aws:policy/job-function/ViewOnlyAccess

terraform import aws_iam_role_policy_attachment.SecurityAudit patreon-RemediationFunctionRole-1WBHRVFHOJVLL/arn:aws:iam::aws:policy/SecurityAudit

terraform import aws_iam_role_policy_attachment.AWSLambdaSQSQueueExecutionRole patreon-RemediationFunctionRole-1WBHRVFHOJVLL/arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole

terraform import aws_iam_role_policy_attachment.AWSLambdaBasicExecutionRole patreon-RemediationFunctionRole-1WBHRVFHOJVLL/arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

terraform import aws_ssm_parameter.api-token /bridgecrew/api-toke

terraform import aws_sqs_queue_policy.InboundRemediations https://sqs.us-east-2.amazonaws.com/481212720429/patreon-InboundRemediations-13WM2ST22347Y.fifo

terraform import aws_lambda_function.BridgecrewRemoteRemediation BridgecrewRemoteRemediation

aws sqs list-event-source-mappings --lambda_name BridgecrewRemoteRemediation

terraform import aws_lambda_event_source_mapping.InboundRemediationsMapping 4aa8b152-35ea-4ba1-b3fc-3618f4c196ed
```