
resource "aws_security_group" "servers-sg" {
  name = "dokuwiki-sg"
#  vpc_id = data.aws_vpc.default.id
  vpc_id = module.ec2_deploy.default_vpc_id
}

resource "aws_security_group_rule" "ingress_port_80" {
  type              = "ingress"
  from_port         = 0
  to_port           = 80
  protocol          = -1
  security_group_id = aws_security_group.servers-sg.id
  self              = true
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  to_port           = 0
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  security_group_id = aws_security_group.servers-sg.id
}