variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "stage_name" {
  description = "The stage name for the API"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for VPC Link"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for VPC Link"
  type        = list(string)
}

