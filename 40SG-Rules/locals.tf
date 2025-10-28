locals {
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  bastion_alb_sg_id = data.aws_ssm_parameter.bastion_alb_sg_id.value
}