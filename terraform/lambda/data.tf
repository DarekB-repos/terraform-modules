data "aws_s3_bucket_object" "lambda_hash" {
  bucket = var.lambda_deploy_bucket
  key    = "my-lambda-name.sha256"
}
