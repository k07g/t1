resource "aws_vpc" "g" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "g"
  }
}

resource "aws_subnet" "g2" {
  vpc_id     = aws_vpc.g.id
  cidr_block = "10.1.1.0/24"
  tags = {
    Name = "g2"
  }
}

resource "aws_subnet" "planning_poker_public" {
  vpc_id     = aws_vpc.g.id
  cidr_block = "10.1.2.0/24"
  tags = {
    Name = "planning_poker_public"
  }
}