variable "aws_accountId" {
  type        = string
  description = "AWS account"
  default     = "X"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}


variable "lambda_deploy_bucket" {
  type        = string
  description = "Bucket containing zipped Lambda code"
}

variable "aws_environment" {
  type        = string
  description = "Deployment environment which TF is being run against"
  default     = "dev"
}

variable "vpc_subnet_ids" {
  type        = list(string)
  description = "Private Subnets for the Lambda"
}


variable "aws_route_table_private_sub_1_id" {
  type = string
}

variable "aws_route_table_private_sub_2_id" {
  type = string
}

variable "vpc_security_group_id" {
  type = string

}

variable "vpc_id" {
  type = string
}