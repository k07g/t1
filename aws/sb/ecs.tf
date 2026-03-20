resource "aws_ecr_repository" "g2" {
  name                 = "g2"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}