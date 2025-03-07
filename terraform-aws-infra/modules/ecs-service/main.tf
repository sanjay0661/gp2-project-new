resource "aws_ecs_service" "ecs_service" {
  name            = "${var.environment}-ecs-service"
  cluster        = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = "EC2"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.security_group_id]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  service_connect_configuration {
    enabled = true
    namespace = var.service_connect_namespace

    service {
      discovery_name  = var.container_name
      client_alias {
        dns_name = var.container_name
        port     = var.container_port
      }
      port_name = "service-connect"
    }
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}
