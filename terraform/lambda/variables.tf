variable "lambda_deploy_bucket" {
  type        = string
  description = "Bucket containing zipped Lambda code"
}

variable "lambda_execution_role_arn" {
  type        = string
  description = "Lambda execution role"
}

variable "aws_stage" {
  type        = string
  description = "AWS stage"
  default     = "v1" // Injected into the Domain Path & Stage name instead of Dev
}


variable "aws_environment" {
  type        = string
  description = "Deployment environment which TF is being run against"
  default     = "dev"
}
