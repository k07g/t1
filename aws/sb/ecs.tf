/*
resource "aws_ecs_cluster" "planning_poker" {
  name = "planning-poker"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_security_group" "ecs_task" {
  name   = "t1-sb-ecs-task"
  vpc_id = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_task_definition" "g2" {
  family                   = "g2"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = "g2"
      image     = "${aws_ecr_repository.g2.repository_url}:latest"
      essential = true
    }
  ])
}

resource "aws_ecs_service" "g2" {
  name            = "g2"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.g2.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = data.aws_subnets.default.ids
    security_groups  = [aws_security_group.ecs_task.id]
    assign_public_ip = true
  }
}
*/