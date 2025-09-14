# Hub-and-Spoke
Let’s build a Basic Multi-VPC Hub-and-Spoke with AWS Transit Gateway using Terraform

# What you’ll deploy

- 1 Transit Gateway (TGW) with 1 TGW Route Table

- 3 Spoke VPCs (10.0.0.0/16, 10.1.0.0/16, 10.2.0.0/16), each with:

- 2 private subnets (across 2 AZs)
  
  - 1 TGW attachment (using those subnets)
  
  - A VPC route table that sends the other spokes’ CIDRs to the TGW

- (Optional) Tiny EC2 instances in each VPC for ping tests (security group allows ICMP among spokes)

# achitecture

```mermaid
flowchart LR
  TGW[(Transit Gateway)]
  subgraph VPC0[Spoke VPC A 10.0.0.0/16]
    A1[Private Subnet A1]
    A2[Private Subnet A2]
  end
  subgraph VPC1[Spoke VPC B 10.1.0.0/16]
    B1[Private Subnet B1]
    B2[Private Subnet B2]
  end
  subgraph VPC2[Spoke VPC C 10.2.0.0/16]
    C1[Private Subnet C1]
    C2[Private Subnet C2]
  end
  A1 -- TGW Attachment --> TGW
  B1 -- TGW Attachment --> TGW
  C1 -- TGW Attachment --> TGW
  A2 --- TGW
  B2 --- TGW
  C2 --- TGW
```