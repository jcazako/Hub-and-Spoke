output "vpc_attributes" {
  description = "List of VPC IDs and ARNs"
  value = [
    for vpc in aws_vpc.spokes : {
      vpc_id   = vpc.id
      vpc_arn  = vpc.arn
      vpc_cidr = vpc.cidr_block
    }
  ]
}