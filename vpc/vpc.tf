resource "aws_vpc" "this" {
  cidr_block       = var.cidr
  instance_tenancy = "default"
  enable_dns_support = var.dns_support
  tags = var.tags

}
