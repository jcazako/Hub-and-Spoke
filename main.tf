locals {
  # derive two /20 subnets per VPC from the /16
  subnet_bits = 4
}

resource "aws_vpc" "spokes" {
  for_each             = var.spokes
  cidr_block           = each.value.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "${var.project}-${each.key}" }
}