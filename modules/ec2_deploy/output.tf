
output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "default_security_group_id" {
  value = data.aws_security_group.default.id
}

output "aws_default_subnet_ids" {
  value = data.aws_subnets.default.ids
}

output "key_name" {
  value = data.aws_key_pair.devops.key_name
}

#output "default_vpc_subnets_ids" {
#  value = data.aws_subnets.default.ids
#}
