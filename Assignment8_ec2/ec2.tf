locals {
  user_data = <<EOF
#!/usr/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 --name dokuwiki bitnami/dokuwiki:latest
EOF
}

resource "aws_instance" "dokuwiki" {
  ami     = var.ami_id
  instance_type = var.instance_type
  key_name = module.ec2_deploy.key_name
  user_data = base64encode(local.user_data)
  vpc_security_group_ids = [aws_security_group.servers-sg.id, module.ec2_deploy.default_security_group_id]
  depends_on = [aws_security_group.servers-sg]

}