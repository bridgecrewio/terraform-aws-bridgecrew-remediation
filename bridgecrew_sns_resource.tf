data template_file "message" {
  template = file("${path.module}/sns_message.json")
  vars     = {
    request_type         = "Create"
    bridgecrew_sns_topic = local.sns_topic_arn
    account_id           = local.account_id
    template_version     = local.template_version
    inbound_sqs          = aws_sqs_queue.InboundRemediations.id
  }
}

resource "null_resource" "await_resources" {
  provisioner "local-exec" {
    command = "sleep 10"
  }

  depends_on = [
    aws_sqs_queue.InboundRemediations,
    aws_sqs_queue.RemediationsDLQ,
    aws_lambda_function.BridgecrewRemoteRemediation,
    aws_iam_role.RemediationFunctionRole]
}

resource null_resource "create_bridgecrew" {
  provisioner "local-exec" {
    command     = "aws sns ${local.profile_str} --region ${local.region} publish --target-arn \"${local.sns_topic_arn}\" --message '${jsonencode(data.template_file.message.rendered)}' && sleep 30"
    working_dir = path.module
  }

  depends_on = [
    null_resource.await_resources]
}

resource null_resource "update_bridgecrew" {
  triggers = {
    build = md5(data.template_file.message.rendered)
  }

  provisioner "local-exec" {
    command     = "aws sns ${local.profile_str} --region ${local.region} publish --target-arn \"${local.sns_topic_arn}\" --message '${jsonencode(replace(data.template_file.message.rendered, "Create", "Update"))}'"
    working_dir = path.module
  }

  depends_on = [
    null_resource.create_bridgecrew
  ]
}

resource null_resource "disconnect_bridgecrew" {
  triggers = {
    profile   = local.profile_str
    region    = local.region
    message   = jsonencode(replace(data.template_file.message.rendered, "Create", "Delete"))
    sns_topic = local.sns_topic_arn
  }

  provisioner "local-exec" {
    command     = "aws sns ${self.triggers.profile} --region ${self.triggers.region} publish --target-arn \"${self.triggers.sns_topic}\" --message '${self.triggers.message}'"
    when        = destroy
    working_dir = path.module
  }

  depends_on = [
    null_resource.create_bridgecrew
  ]
}