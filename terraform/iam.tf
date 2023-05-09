data "aws_iam_policy_document" "lambda-assume-role-policy" {
  statement {
    effect = "Allow"
    actions = [
    "sts:AssumeRole"]
    principals {
      identifiers = [
      "lambda.amazonaws.com"]
      type = "Service"
    }
  }
}


resource "aws_iam_role" "lambda-role" {
  path                 = "/"
  description          = "Execution role for  lambdas"
  assume_role_policy   = data.aws_iam_policy_document.lambda-assume-role-policy.json
  permissions_boundary = "arn:aws:iam::${var.aws_accountId}:policy/Mode2GenericRoleBoundary"
}

resource "aws_iam_policy" "lambda-role" {
  path        = "/"
  description = "Allow access to resources designed lambda"
  policy      = data.aws_iam_policy_document.lambda-assume-role-policy.json
}

resource "aws_iam_policy_attachment" "lambda-role" {
  name = "lambda-role-role-policy-attachment"
  roles = [
  aws_iam_role.lambda-role.name]
  policy_arn = aws_iam_policy.lambda-role.arn
}

resource "aws_iam_role_policy_attachment" "rLambdaBasicRoleExecution" {
  role       = aws_iam_role.lambda-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "rlambdaEC2PolicyAttachment" {
  role       = aws_iam_role.lambda-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}


