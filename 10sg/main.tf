# module "vote_service_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false
#   description = "Security group for catalogue with custom ports open within VPC, egress all trafic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value

  
# }


module "sg" {
  source = "git::https://github.com/saikiran0889/terraform-aws-sg.git"
    count = length(var.sg_name)
    projectname = var.project
    environment = var.environment
    sg_name = var.sg_name[count.index]
    vpc_id = local.vpc_id
    description = "${var.sg_name[count.index]} SG"


}