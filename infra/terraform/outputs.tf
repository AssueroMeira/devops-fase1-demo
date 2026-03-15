output "instance_public_ip" {
  description = "IP público da instância EC2."
  value       = aws_instance.this.public_ip
}

output "ssh_command" {
  description = "Comando sugerido para acesso SSH."
  value       = "ssh ec2-user@${aws_instance.this.public_ip}"
}

output "http_url" {
  description = "URL HTTP (se enable_http = true)."
  value       = var.enable_http ? "http://${aws_instance.this.public_ip}" : null
}
