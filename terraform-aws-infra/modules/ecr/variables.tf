variable "repository_names" {
  description = "List of ECR repository names"
  type        = list(string)
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
