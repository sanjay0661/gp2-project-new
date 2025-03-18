variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID to attach to the ALB"
  type        = string
}

variable "container_port" {
  description = "The port on which the container is running"
  type        = number
}

variable "health_check_path" {
  description = "Health check path for ALB target group"
  type        = string
  default     = "/"
}

variable "gateway_target_group_arn" {
  description = "ARN of the Gateway Target Group"
  type        = string
}

variable "marketing_target_group_arn" {
  description = "ARN of the Marketing Target Group"
  type        = string
}

variable "webhook_target_group_arn" {
  description = "ARN of the Webhook Target Group"
  type        = string
}

variable "permitio_target_group_arn" {
  description = "ARN of the Permit.io Target Group"
  type        = string
}

variable "frontend_tenant_target_group_arn" {
  description = "ARN of the Frontend Tenant Target Group"
  type        = string
}
