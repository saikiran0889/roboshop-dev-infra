locals {
  ami_id = data.aws_ami.awsdevops.id
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  database_subnet_ids = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]

  common_tags = {
    project = var.project
    environment = var.environment
    terraform = true
  }
}