output "public_subnet_ids" {
  value = data.aws_ssm_parameter.public_subnet_ids
   sensitive = true
}