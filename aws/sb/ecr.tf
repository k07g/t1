# g2
resource "aws_ecr_repository" "g2" {
  name                 = "g2"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

data "aws_ecr_lifecycle_policy_document" "untagged" {
  rule {
    priority    = 1
    description = "Expire untagged images older than 14 days"
    selection {
      tag_status   = "untagged"
      count_type   = "sinceImagePushed"
      count_number = 14
      count_unit   = "days"
    }
    action {
      type = "expire"
    }
  }
}

resource "aws_ecr_lifecycle_policy" "g2" {
  repository = aws_ecr_repository.g2.name
  policy     = data.aws_ecr_lifecycle_policy_document.untagged.json
}

# planning poker
resource "aws_ecr_repository" "planning_poker" {
  name                 = "planning-poker"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "planning_poker" {
  repository = aws_ecr_repository.planning_poker.name
  policy     = data.aws_ecr_lifecycle_policy_document.untagged.json
}