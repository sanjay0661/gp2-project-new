resource "aws_lb" "ecs_alb" {
  name               = "${var.environment}-ecs-alb"
  internal           = true  # Internal ALB for private subnets
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.private_subnet_ids  # Use private subnets

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "ecs_tg" {
  name     = "${var.environment}-ecs-tg"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "ecs_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}
