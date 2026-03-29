output "alb_dns_name" {
  description = "DNS público do ALB."
  value       = aws_lb.this.dns_name
}

output "app_url" {
  description = "URL pública da aplicação."
  value       = "http://${aws_lb.this.dns_name}"
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS."
  value       = aws_ecs_cluster.this.name
}

output "ecs_service_name" {
  description = "Nome do service ECS."
  value       = aws_ecs_service.app.name
}

output "task_definition_arn" {
  description = "ARN da task definition."
  value       = aws_ecs_task_definition.app.arn
}

output "container_image" {
  description = "Imagem usada no ECS."
  value       = local.container_image
}