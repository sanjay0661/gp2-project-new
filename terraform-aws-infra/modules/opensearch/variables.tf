variable "vpc_id" {
  description = "VPC ID for OpenSearch"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "allowed_ips" {
  description = "List of CIDR blocks allowed to access OpenSearch"
  type        = list(string)
}

variable "domain_name" {
  description = "OpenSearch domain name"
  type        = string
}

variable "engine_version" {
  description = "OpenSearch version"
  type        = string
  default     = "OpenSearch_2.11"
}

variable "instance_type" {
  description = "Instance type for OpenSearch"
  type        = string
  default     = "t3.medium.search"
}

variable "instance_count" {
  description = "Number of instances in OpenSearch cluster"
  type        = number
  default     = 2
}

variable "volume_size" {
  description = "EBS volume size for OpenSearch"
  type        = number
  default     = 20
}

variable "master_user_name" {
  description = "Master username for OpenSearch"
  type        = string
}

variable "master_user_password" {
  description = "Master password for OpenSearch"
  type        = string
  sensitive   = true
}
