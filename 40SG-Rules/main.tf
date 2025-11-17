resource "aws_security_group_rule" "backend_alb_bastion" {
    type = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id =  local.bastion_alb_sg_id
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}


resource "aws_security_group_rule" "backend_laptop" {
    type = "ingress"
  security_group_id = local.bastion_alb_sg_id
  cidr_blocks = [ "0.0.0.0/0" ]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}



resource "aws_security_group_rule" "mongodb_bastion" {
    type = "ingress"
  security_group_id = local.mongodb_sg_id
  source_security_group_id =  local.bastion_alb_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "redis_bastion" {
    type = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id =  local.bastion_alb_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "rabbitmq_bastion" {
    type = "ingress"
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id =  local.bastion_alb_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mysql_bastion" {
    type = "ingress"
  security_group_id = local.mysql_sg_id
  source_security_group_id =  local.bastion_alb_sg_id
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}


resource "aws_security_group_rule" "openvpn_public" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "openvpn_943" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 943
  protocol          = "tcp"
  to_port           = 943
}

resource "aws_security_group_rule" "openvpn_443" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "openvpn_1194" {
  type              = "ingress"
  security_group_id = local.openvpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 1194
  protocol          = "tcp"
  to_port           = 1194 
}

resource "aws_security_group_rule" "openvpn_mongodb" {
  type              = "ingress"
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.openvpn_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "components_vpn" {
  for_each = local.vpn_ingress_rules
  type              = "ingress"
  security_group_id = each.value.sg_id
  source_security_group_id = local.openvpn_sg_id
  from_port         = each.value.port
  protocol          = "tcp"
  to_port           = each.value.port
}
