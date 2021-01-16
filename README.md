# terraform-aws-bridgecrew-remediation

[![Build Status](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation/workflows/Verify%20and%20Bump/badge.svg?branch=main)](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation)
[![Latest Release](https://img.shields.io/github/release/bridgecrewio/terraform-aws-bridgecrew-remediation.svg)](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation/releases/latest)
[![Maintained by Bridgecrew.io](https://img.shields.io/badge/maintained%20by-bridgecrew.io-blueviolet)](https://bridgecrew.io)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/bridgecrewio/terraform-aws-bridgecrew-remediation.svg?label=latest)](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/bridgecrewio/terraform-aws-bridgecrew-remediation/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fterraform-aws-bridgecrew-remediation&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module - for Bridgecrew Remediations

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include **module.remediation.tf** this repository as a module in your existing Terraform code:

```terraform
module "remediation" {
  source      = "bridgecrewio/bridgecrew-remediation/aws"
  api-token   = var.apitoken
  version     = "v0.1.1"
}
```

The module expect the Bridgecrew platform API token to be supplied.

On Windows:

```powershell
$env:TF_VAR_apitoken="your-platform-token"
```

On *nix:

```shell
export TF_VAR_apitoken="your-platform-token"
```

Or you can leave it to be prompted at your console.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| Lambda\_timeout | n/a | `number` | `900` | no |
| api-token | Bridgecrew Platform API key | `string` | n/a | yes |
| batch\_size | n/a | `number` | `1` | no |
| common\_tags | n/a | `map` | `{}` | no |
| customer\_name | Customer name identifier - e.g. Patreon, Bridgecrew | `string` | n/a | yes |
| fifo\_queue | Is queue fifo? | `bool` | `true` | no |
| kms\_data\_key\_reuse\_period\_seconds | n/a | `number` | `300` | no |
| lambdaZipName | The Object to get from the Bucket | `string` | `"prod/remediations_lambda_c5f16a2212411fd69a5c6a5fe37278617df82f5a.zip"` | no |
| maximum\_batching\_window\_in\_seconds | n/a | `number` | `0` | no |
| organizationID | n/a | `string` | `"890234264427"` | no |
| outboundRemediationsEndpoint | n/a | `string` | `"https://dfak3u9wq1.execute-api.us-west-2.amazonaws.com/v1"` | no |
| runtime | n/a | `string` | `"nodejs10.x"` | no |
| snsNotifyTopic | n/a | `string` | `"handle-customer-actions"` | no |
| templateBucket | Public bucket to get the Lambda zipped code from | `string` | `"bc-code-artifacts-890234264427-"` | no |
| templateVersion | n/a | `string` | `"0.3.37"` | no |

## Outputs

| Name | Description |
|------|-------------|
| InboundRemediations | n/a |
| InboundRemediationsARN | SQS ARN of inbound Bridgecrew remote remediations messages |
| RemediationsDLQ | n/a |
| TemplateVersion | Deployed CF stack version |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-bridgecrew-remediation](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation)

## Help

**Got a question?**

File a GitHub [issue](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2021 Bridgecrew

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/bridgecrewio
[linkedin]: https://www.linkedin.com/in/bridgecrew/
[twitter]: https://twitter.com/bridgecrew
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-bridgecrew-remediation&url=https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-bridgecrew-remediation&url=https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation
[share_reddit]: https://reddit.com/submit/?url=https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation
[share_email]: mailto:?subject=terraform-aws-bridgecrew-remediation&body=https://github.com/bridgecrewio/terraform-aws-bridgecrew-remediation
