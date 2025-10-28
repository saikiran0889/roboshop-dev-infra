data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.project}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "bastion_alb_sg_id" {
  name = "/${var.project}/${var.environment}/bastion_sg_id"
}


