run "vpc_cidrs_are_exclusive" {
  command = plan

  # we expect exactly 3 VPCs
  assert {
    condition     = length(output.vpc_attributes) == 3
    error_message = "Expected 3 VPCs, got ${length(output.vpc_attributes)}. Attributes: ${jsonencode(output.vpc_attributes)}"
  }

  # pairwise disjoint: no range contains another (overlap implies containment for aligned CIDRs)
  assert {
    condition = alltrue(flatten([
      for i in range(length(output.vpc_attributes)) : [
        for j in range(i + 1, length(output.vpc_attributes)) :
          (!cidrcontains(output.vpc_attributes[i].vpc_cidr, output.vpc_attributes[j].vpc_cidr)) &&
          (!cidrcontains(output.vpc_attributes[j].vpc_cidr, output.vpc_attributes[i].vpc_cidr))
      ]
    ]))
    error_message = "Overlapping VPC CIDRs detected: ${jsonencode(output.vpc_attributes)}"
  }
}
