output "ecs_cluster_id" {
  description = "ID of the ECS Cluster"
  value       = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_asg_id" {
  description = "ID of the Auto Scaling Group"
  value       = aws_autoscaling_group.ecs_asg.id
}



