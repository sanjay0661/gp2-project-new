resource "aws_apigatewayv2_api" "http_api" {
  name        = "${var.environment}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = var.stage_name
  auto_deploy = true
}

resource "aws_apigatewayv2_route" "proxy" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
}

output "api_gateway_endpoint" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}

resource "aws_apigatewayv2_vpc_link" "vpc_link" {
  name        = "${var.environment}-vpc-link"
  security_group_ids = [var.security_group_id]
  subnet_ids  = var.private_subnet_ids
}

