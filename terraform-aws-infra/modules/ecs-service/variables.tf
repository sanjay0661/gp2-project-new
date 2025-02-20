variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "cluster_id" {
  description = "ECS cluster ID"
  type        = string
}

variable "task_definition_arn" {
  description = "ECS task definition ARN"
  type        = string
}

variable "desired_count" {
  description = "Number of instances of the task to run"
  type        = number
  default     = 1
}

variable "private_subnet_ids" {
  description = "List of private subnets for the service"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group for the ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for the load balancer"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_port" {
  description = "Port of the container"
  type        = number
}
