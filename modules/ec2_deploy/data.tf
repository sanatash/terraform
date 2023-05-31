data "aws_vpc" "default" {
  default = true
}

#data "aws_security_group" "default-sg" {
#  name = "default"
#}

data "aws_subnets" "default" {}

data "aws_security_group" "default" {
  name = "default"
  vpc_id = data.aws_vpc.default.id
}

data "aws_key_pair" "devops"{
  key_name = "DevOps2601"
}
