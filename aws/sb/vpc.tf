data "aws_vpc" "default" {
  id = "vpc-05750848aa0be076d"
}

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

resource "aws_security_group" "sg_alb" {
  name        = "sgAlb"
  description = "Security group for ALB"
  vpc_id      = data.aws_vpc.default.id
  tags = {
    Name = "sg-alb"
  }
}