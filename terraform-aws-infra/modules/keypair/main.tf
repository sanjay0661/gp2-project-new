resource "tls_private_key" "ecs_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ecs_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.ecs_key.public_key_openssh
}

resource "local_file" "private_key" {
  filename = "${path.module}/${var.key_name}.pem"
  content  = tls_private_key.ecs_key.private_key_pem
  file_permission = "0600"
}