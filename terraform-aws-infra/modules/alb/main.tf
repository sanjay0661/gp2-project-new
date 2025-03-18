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
    path                = var.health_check_path
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

resource "aws_lb_listener_rule" "gateway" {
  listener_arn = aws_lb_listener.ecs_listener.arn
  priority     = 1

  condition {
    path_pattern {
      values = ["/graphql*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.gateway_target_group_arn
  }
}

resource "aws_lb_listener_rule" "marketing" {
  listener_arn = aws_lb_listener.ecs_listener.arn
  priority     = 2

  condition {
    host_header {
      values = ["marketing.dev.goperla.com"]
    }
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.marketing_target_group_arn
  }
}

resource "aws_lb_listener_rule" "webhook" {
  listener_arn = aws_lb_listener.ecs_listener.arn
  priority     = 3

  condition {
    path_pattern {
      values = ["/api/webhook*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.webhook_target_group_arn
  }
}

resource "aws_lb_listener_rule" "permitio" {
  listener_arn = aws_lb_listener.ecs_listener.arn
  priority     = 4

  condition {
    path_pattern {
      values = ["/api/permitio*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.permitio_target_group_arn
  }
}

resource "aws_lb_listener_rule" "frontend_tenant" {
  listener_arn = aws_lb_listener.ecs_listener.arn
  priority     = 5

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.frontend_tenant_target_group_arn
  }
}


resource "aws_lb_target_group" "gateway" {
  name        = "ecs-gp2-dev-backend-gateway"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/gateway/health"
  }
}

resource "aws_lb_target_group" "tenant" {
  name        = "ecs-gp2-dev-frontend-tenant"
  port        = 3001
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/tenant/health"
  }
}

resource "aws_lb_target_group" "webhook" {
  name        = "ecs-gp2-dev-backend-webhook"
  port        = 5007
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/webhook/health"
  }
}

resource "aws_lb_target_group" "permitio" {
  name        = "ecs-gp2-dev-permitio"
  port        = 5005  # ✅ Adjust based on the actual port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/permitio/health"
  }
}


resource "aws_lb_target_group" "marketing" {
  name        = "ecs-gp2-dev-frontend-marketing"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/marketing/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  stickiness {
    type    = "lb_cookie"
    enabled = false  # Ensure stickiness is OFF
  }
}
