variable "aws_region" {
  description = "The AWS region where the API Gateway will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "gp2-dev"
}

variable "stage_name" {
  description = "The name of the deployment stage"
  type        = string
  default     = "dev"
}
