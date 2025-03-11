output "ecs_task_definition_arn" {
  description = "The ARN of the ECS task definition"
  value       = aws_ecs_task_definition.police_task.arn
}

output "ecs_task_definition_revision" {
  description = "The revision number of the ECS task definition"
  value       = aws_ecs_task_definition.police_task.revision
}

output "ecs_task_family" {
  description = "The family name of the ECS task definition"
  value       = aws_ecs_task_definition.police_task.family
}
