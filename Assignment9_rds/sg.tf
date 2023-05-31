resource "aws_security_group" "rds-sg" {
  name   = "bookstack-sg"
  vpc_id = module.ec2_deploy.default_vpc_id
  description = "Enables access to bookstack database"
}

resource "aws_security_group_rule" "ingress-all" {
  security_group_id = aws_security_group.rds-sg.id
  from_port         = 0
  to_port           = 0
  protocol          = -1
  type              = "ingress"
  self              = true
}

resource "aws_security_group_rule" "egress-all" {
  from_port         = 0
  protocol          = "TCP"
  security_group_id = aws_security_group.rds-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 0
  type              = "egress"
}


