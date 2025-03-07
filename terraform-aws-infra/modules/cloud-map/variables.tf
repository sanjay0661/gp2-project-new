variable "namespace_name" {
  description = "The name of the Cloud Map namespace"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the namespace will be created"
  type        = string
}
