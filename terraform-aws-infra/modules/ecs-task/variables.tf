variable "family" {
  description = "The family name of the ECS task definition"
  type        = string
}

variable "cpu" {
  description = "The CPU units for the container"
  type        = number

}

variable "memory" {
  description = "The memory (in MiB) for the container"
  type        = number

}

variable "execution_role_arn" {
  description = "The ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the ECS task role"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "ecr_repository_url" {
  description = "The URL of the ECR repository"
  type        = string
}

variable "container_port" {
  description = "The port the container will listen on"
  type        = number

}

variable "aws_region" {
  description = "The AWS region"
  type        = string

}

variable "environment_variables" {
  description = "List of environment variables for the container"
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}
