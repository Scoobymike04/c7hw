resource "aws_vpc" "main" {
  cidr_block           = "10.90.0.0/16"
  instance_tenancy     = "default" #optional, default option is setting this argument
  enable_dns_hostnames = true
  enable_dns_support   = true #optional, default to true

  tags = {
    Name = "BAM4.1-vpc"
  }
}