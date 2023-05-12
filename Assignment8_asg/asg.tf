locals {
  user_data = <<EOF
#!/usr/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 --name dokuwiki bitnami/dokuwiki:latest
EOF
}

resource "aws_launch_template" "my-lt" {
  name = "my-lt"
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = module.ec2_deploy.key_name
  vpc_security_group_ids = [aws_security_group.servers-sg.id, module.ec2_deploy.default_security_group_id]
  user_data  = base64encode(local.user_data)
  depends_on = [aws_security_group.servers-sg]
}

resource "aws_autoscaling_group" "asg" {
  max_size = 1
  min_size = 0
  desired_capacity = 1
  vpc_zone_identifier = module.ec2_deploy.aws_default_subnet_ids
  launch_template {
    name    = aws_launch_template.my-lt.name
    version = aws_launch_template.my-lt.latest_version
  }
}