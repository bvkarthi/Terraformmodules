locals {
  vpc_id = aws_vpc.this.*.id[0]
}
resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
 

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}


####internetgateway
resource "aws_internet_gateway" "this" {
  count = var.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = local.vpc_id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}



# ################
# # Publiс routes
# ################
# resource "aws_route_table" "public" {
#   count = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0

#   vpc_id = local.vpc_id

#   tags = merge(
#     {
#       "Name" = format("%s-${var.public_subnet_suffix}", var.name)
#     },
#     var.tags,
#     var.public_route_table_tags,
#   )
# }

# resource "aws_route" "public_internet_gateway" {
#   count = var.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0

#   route_table_id         = aws_route_table.public[0].id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.this[0].id

#   timeouts {
#     create = "5m"
#   }
# }

# resource "aws_route" "public_internet_gateway_ipv6" {
#   count = var.create_vpc && var.create_igw && var.enable_ipv6 && length(var.public_subnets) > 0 ? 1 : 0

#   route_table_id              = aws_route_table.public[0].id
#   destination_ipv6_cidr_block = "::/0"
#   gateway_id                  = aws_internet_gateway.this[0].id
# }

# #################
# # Private routes
# # There are as many routing tables as the number of NAT gateways
# #################
# resource "aws_route_table" "private" {
#   count = var.create_vpc && local.max_subnet_length > 0 ? local.nat_gateway_count : 0

#   vpc_id = local.vpc_id

#   tags = merge(
#     {
#       "Name" = var.single_nat_gateway ? "${var.name}-${var.private_subnet_suffix}" : format(
#         "%s-${var.private_subnet_suffix}-%s",
#         var.name,
#         element(var.azs, count.index),
#       )
#     },
#     var.tags,
#     var.private_route_table_tags,
#   )
# }