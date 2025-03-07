output "ecs_service_name" {
  value = aws_ecs_service.ecs_service.name
}


output "ecs_service_id" {
  description = "ID of the ECS Service"
  value       = aws_ecs_service.ecs_service.id
}
