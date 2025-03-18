output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.ecs_alb.dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.ecs_tg.arn
}

output "alb_arn" {
  value = aws_lb.ecs_alb.arn
}

output "marketing_listener_rule_id" {
  value = aws_lb_listener_rule.marketing.id
}

output "webhook_listener_rule_id" {
  value = aws_lb_listener_rule.webhook.id
}

output "permitio_listener_rule_id" {
  value = aws_lb_listener_rule.permitio.id
}

output "frontend_tenant_listener_rule_id" {
  value = aws_lb_listener_rule.frontend_tenant.id
}


output "gateway_target_group_arn" {
  value = aws_lb_target_group.gateway.arn
}

output "marketing_target_group_arn" {
  value = aws_lb_target_group.marketing.arn
}

output "webhook_target_group_arn" {
  value = aws_lb_target_group.webhook.arn
}

output "permitio_target_group_arn" {
  value = aws_lb_target_group.permitio.arn
}

output "frontend_tenant_target_group_arn" {
  value = aws_lb_target_group.tenant.arn
}

