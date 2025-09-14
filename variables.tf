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