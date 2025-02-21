output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

output "public_key" {
  description = "The generated public key"
  value       = tls_private_key.ecs_key.public_key_openssh
}

output "key_name" {
  description = "The name of the SSH key pair"
  value       = aws_key_pair.ecs_key_pair.key_name
}
