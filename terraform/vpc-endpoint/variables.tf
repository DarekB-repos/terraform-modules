variable "vpc_id" {
  type        = string
  description = "Id of the vpc where to create the endpoints"
}

variable "aws_accountId" {
  type        = string
  description = "AWS account"
  default     = "XXXXXXXX"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}

variable "aws_route_table_private_sub_1_id" {
  type        = string
  description = "AWS region"
}

variable "aws_route_table_private_sub_2_id" {
  type        = string
  description = "AWS region"
}

variable "vpc_security_group_id" {
  type        = string
  description = "Security group for the vpc endpoint"
}

variable "vpc_subnet_ids" {
  type        = list(string)
  description = "Private Subnets for the Lambda"
}
