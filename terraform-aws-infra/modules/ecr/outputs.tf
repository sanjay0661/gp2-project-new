output "repository_urls" {
  description = "Map of ECR repository names to their URLs"
  value       = { for repo in aws_ecr_repository.ecr_repos : repo.name => repo.repository_url }
}


output "repository_arns" {
  description = "ARNs of the created ECR repositories"
  value       = { for repo in aws_ecr_repository.ecr_repos : repo.name => repo.arn }
}
