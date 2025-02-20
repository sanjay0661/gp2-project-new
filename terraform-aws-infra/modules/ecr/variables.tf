variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
}

variable "encryption_type" {
  description = "Encryption type for the repository"
  type        = string
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}
