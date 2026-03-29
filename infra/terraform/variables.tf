variable "project_name" {
  type        = string
  description = "Nome do projeto."
  default     = "devops-fase1-demo"
}

variable "environment" {
  type        = string
  description = "Ambiente."
  default     = "staging"
}

variable "aws_region" {
  type        = string
  description = "Região AWS."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR da VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs das subnets públicas."
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "container_port" {
  type        = number
  description = "Porta exposta pela aplicação no container."
  default     = 5000
}

variable "desired_count" {
  type        = number
  description = "Quantidade desejada de tasks ECS."
  default     = 1
}

variable "task_cpu" {
  type        = number
  description = "CPU da task Fargate."
  default     = 256
}

variable "task_memory" {
  type        = number
  description = "Memória da task Fargate."
  default     = 512
}

variable "image_tag" {
  type        = string
  description = "Tag da imagem no ECR."
  default     = "latest"
}

variable "tags" {
  type        = map(string)
  description = "Tags adicionais."
  default     = {}
}