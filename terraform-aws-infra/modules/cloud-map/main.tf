resource "aws_service_discovery_private_dns_namespace" "cloud_map" {
  name = var.namespace_name
  vpc  = var.vpc_id
}

