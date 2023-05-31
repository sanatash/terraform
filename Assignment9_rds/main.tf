module "ec2_deploy" {
  source = "../modules/ec2_deploy"
}

provider "aws" {
  region = "us-east-1"
  #access_key = ""
  #secret_key = ""
}