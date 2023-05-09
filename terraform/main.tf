terraform {
  backend "s3" {
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}



module "lambda" {
  source                    = "./lambda"
  lambda_deploy_bucket      = var.lambda_deploy_bucket
  aws_environment           = var.aws_environment
  lambda_execution_role_arn = aws_iam_role.lambda-role.arn
}

module "vpc-endpoints" {
  source = "./vpc-endpoint"

  vpc_subnet_ids                   = var.vpc_subnet_ids
  aws_route_table_private_sub_1_id = var.aws_route_table_private_sub_1_id
  aws_route_table_private_sub_2_id = var.aws_route_table_private_sub_2_id
  vpc_security_group_id            = var.vpc_security_group_id
  vpc_id                           = var.vpc_id
}