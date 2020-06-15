variable "region" {
  default = "us-east-1"
}

variable "root_domain_name" {
  default = "nicholasmpaz.com"
}

variable "www_domain_name" {
  default = "www.nicholasmpaz.com"
}

data "aws_route53_zone" "hosted_zone" {
  name = var.root_domain_name
}