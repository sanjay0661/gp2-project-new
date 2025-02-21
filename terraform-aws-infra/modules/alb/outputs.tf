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
