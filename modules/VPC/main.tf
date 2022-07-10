# Create VPC
resource "aws_vpc" "main" {
  cidr_block                     = var.vpc_cidr
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
  enable_classiclink             = var.enable_classiclink
  enable_classiclink_dns_support = false

  tags = merge(
    var.tags,
    {
      Name = format("%s-VPC", var.name)
    }
  )

}

# Get list of availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

resource "random_shuffle" "az_list" {
  input        = data.aws_availability_zones.available.names
  result_count = var.max_subnets
}

# Create private subnets
resource "aws_subnet" "private-subnets" {
  vpc_id                  = aws_vpc.main.id
  count                   = var.preferred_number_of_private_subnets == null ? length(data.aws_availability_zones.available.names) : var.preferred_number_of_private_subnets
  cidr_block              = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone       = random_shuffle.az_list.result[count.index + 1]

  tags = merge(
    var.tags,
    {
      Name = format("%s-PrivateSubnet-%s", var.name, count.index)
    },
  )

}

# Create public subnets
resource "aws_subnet" "public-subnets" {
  vpc_id                  = aws_vpc.main.id
  count                   = var.preferred_number_of_public_subnets == null ? length(data.aws_availability_zones.available.names) : var.preferred_number_of_public_subnets
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = random_shuffle.az_list.result[count.index]

  tags = merge(
    var.tags,
    {
      Name = format("%s-PublicSubnet-%s", var.name, count.index)
    },
  )

}