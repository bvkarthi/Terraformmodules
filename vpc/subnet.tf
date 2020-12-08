
################
# Public subnet
################
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id                          = local.vpc_id
  cidr_block                      = var.public_subnets[count.index]
  availability_zone               = var.azs[count.index]
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  tags = merge(
    {
      "Name" = format(
        "%s-%s-%s",
        var.name,var.public_subnet_suffix,
        element(var.azs, count.index),
      )
    },
    var.tags
  )
}

#################
# Private subnet
#################
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id                          = local.vpc_id
  cidr_block                      = var.private_subnets[count.index]
  availability_zone               = var.azs[count.index]

  tags = merge(
    {
      "Name" = format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags
  )
}
