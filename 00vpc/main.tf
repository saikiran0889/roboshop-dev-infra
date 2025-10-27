module "vpc" {
source = "git::https://github.com/saikiran0889/terraform-aws-vpc.git?ref=main"

vpc_cidr = var.vpc_cidr
projectname = var.project
environment = var.environment
vpc_tags = var.vpc_tags
# Public subnet
public_subnet_cidr = var.public_subnet_cidr

# Private subnet
private_subnet_cidr = var.private_subnet_cidr

# database subnet
database_subnet_cidr = var.database_subnet_cidr

is_peering_require = true  # if you don't want peering you can update as false

}


