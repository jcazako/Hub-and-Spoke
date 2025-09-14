variable "project" {
  type    = string
  default = "tgw-lab"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

# Two AZs for each VPC
variable "azs" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "account_id" {
  type        = string
  default     = "111122223333"
  description = "AWS Account ID"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "tgw-lab"
    Owner       = "jcazako"
  }
  description = "A map of tags to assign to resources."
}

# Spoke VPC CIDRs
variable "spokes" {
  description = "Map of spoke VPCs and their CIDRs"
  type = map(object({
    cidr = string
  }))
  default = {
    vpc-a = { cidr = "10.0.0.0/16" }
    vpc-b = { cidr = "10.1.0.0/16" }
    vpc-c = { cidr = "10.2.0.0/16" }
  }
}