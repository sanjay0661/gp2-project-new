output "ecs_instance_profile" {
  description = "The IAM instance profile for ECS instances"
  value       = aws_iam_instance_profile.ecs_instance_profile.name
}

output "ecs_task_role_arn" {
  description = "The IAM role ARN for ECS task execution"
  value       = aws_iam_role.ecs_task_role.arn
}
