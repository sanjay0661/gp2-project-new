output "opensearch_endpoint" {
  description = "OpenSearch cluster endpoint"
  value       = aws_opensearch_domain.opensearch_cluster.endpoint
}

output "opensearch_dashboard_url" {
  description = "OpenSearch dashboard URL"
  value       = aws_opensearch_domain.opensearch_cluster.dashboard_endpoint
}
