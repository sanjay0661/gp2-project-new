resource "aws_ecs_task_definition" "police_task" {
  family                   = var.family
  network_mode             = var.network_mode
  requires_compatibilities = ["EC2"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }


  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = "${var.ecr_repository_url}:latest"
      cpu       = var.cpu
      memory    = var.memory
      memoryReservation = var.memory_reservation
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
          portName      = "service-connect"
          appProtocol   = "http"
        }
      ]

      environment = var.environment_variables
 
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group_name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.log_stream_prefix
        }
      }
    }
  ])
}
 
resource "aws_cloudwatch_log_group" "ecs_task" {
  count             = var.create_log_group ? 1 : 0
  name              = var.log_group_name
  retention_in_days = 7
 
  tags = {
    Environment = "develop"
    Project     = "gp2"
  }
}