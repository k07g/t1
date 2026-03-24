resource "aws_vpc" "k07g" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "k07g"
  }
}