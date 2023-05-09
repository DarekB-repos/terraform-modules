resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.ssm"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    var.vpc_security_group_id,
  ]
  subnet_ids          = var.vpc_subnet_ids
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "kms" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.kms"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    var.vpc_security_group_id,
  ]
  subnet_ids          = var.vpc_subnet_ids
  private_dns_enabled = true
}

