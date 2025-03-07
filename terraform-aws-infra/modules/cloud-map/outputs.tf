output "namespace_id" {
  description = "The ID of the created Cloud Map namespace"
  value       = aws_service_discovery_private_dns_namespace.cloud_map.id
}

