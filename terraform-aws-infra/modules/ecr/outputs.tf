output "repository_url" {
  description = "The URL of the created ECR repository"
  value       = aws_ecr_repository.ecr_repo.repository_url
}

output "repository_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.ecr_repo.arn
}

output "repository_name" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.ecr_repo.name
}
