#tfsec:ignore:aws-lambda-enable-tracing
resource "aws_lambda_function" "lambdaFunction" {
  function_name = "my-lambda-name"

  s3_bucket        = var.lambda_deploy_bucket
  s3_key           = "my-lambda-name.zip"
  source_code_hash = chomp(data.aws_s3_bucket_object.lambda_hash.body)

  handler     = "handler.handler"
  runtime     = "nodejs14.x"
  timeout     = 30
  memory_size = 512

  role = var.lambda_execution_role_arn
}
