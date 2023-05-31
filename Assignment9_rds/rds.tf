resource "aws_db_instance" "default" {
  identifier = "bookstack"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  username = "bookstack"
  password = "secret123"
  vpc_security_group_ids = [aws_security_group.rds-sg.id, module.ec2_deploy.default_security_group_id]
  db_subnet_group_name = "subnet_group"
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = module.ec2_deploy.aws_default_subnet_ids
}