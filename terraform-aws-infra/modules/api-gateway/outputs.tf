output "api_gateway_url" {
  description = "The invoke URL of the API Gateway"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}

output "vpc_link_id" {
  description = "The ID of the VPC Link"
  value       = aws_apigatewayv2_vpc_link.vpc_link.id
}

