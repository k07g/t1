##################################################################
# IAM Roles and Policies for ECS Task Execution
##################################################################
data "aws_iam_policy" "ecs_task_execution" {
  name = "AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["381491879510"]
    }
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:ecs:*:381491879510:*"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution.json
  description        = "Allows access to other AWS service resources that are required to run Amazon ECS tasks."
  path               = "/service-role/"
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = data.aws_iam_policy.ecs_task_execution.arn
}

##################################################################
# IAM Roles and Policies for ECS Infrastructure
##################################################################
data "aws_iam_policy" "ecs_infrastructure" {
  name = "AmazonECSInfrastructureRoleforExpressGatewayServices"
}

data "aws_iam_policy_document" "ecs_infrastructure" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["381491879510"]
    }
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:ecs:*:381491879510:*"]
    }
  }
}

resource "aws_iam_role" "ecs_infrastructure" {
  name               = "ecsInfrastructureRoleForExpressServices"
  assume_role_policy = data.aws_iam_policy_document.ecs_infrastructure.json
  description        = "This role allows Amazon ECS to manage resources associated with Amazon ECS Express services."
  path               = "/service-role/"
}
