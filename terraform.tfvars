region = "us-east-2"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

private_subnets = 4

public_subnets = 2

max_subnets = 10

ami-web = "ami-0aeb7c931a5a61206"

ami-bastion = "ami-0aeb7c931a5a61206"

ami-nginx = "ami-0aeb7c931a5a61206"

ami-sonar = "ami-0aeb7c931a5a61206"

keypair = "obafema-ec2"

master-username = "obafema"

master-password = "Zicozigali_07"

account_no = "620444491882"

environment = "dev"

tags = {
  Enviroment      = "production"
  Owner-Email     = "obafema@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "620444491882"
}