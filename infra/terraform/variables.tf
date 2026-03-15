variable "project_name" {
  type        = string
  description = "Nome do projeto (usado para nomear recursos)."
}

variable "environment" {
  type        = string
  description = "Ambiente (ex.: staging, dev, prod)."
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

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR da subnet pública."
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2."
  default     = "t3.micro"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR liberado para SSH (ex.: seu IP/32)."
}

variable "public_key" {
  type        = string
  description = "Chave pública SSH (conteúdo do arquivo id_rsa.pub)."
  sensitive   = true
}

variable "enable_http" {
  type        = bool
  description = "Se true, libera porta 80 para acesso público (ex.: Nginx de exemplo)."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags adicionais."
  default     = {}
}
