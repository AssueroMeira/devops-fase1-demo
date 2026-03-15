# Template – Fase 1 – DevOps na Prática (Configuração e Automação Inicial)

> **Link do repositório (substituir após publicar no GitHub):**
> `https://github.com/AssueroMeira/devops-fase1-demo`

## 1) Descrição do projeto
Este repositório entrega os itens exigidos na **Fase 1** do projeto “DevOps na Prática”:

- Pipeline de **Integração Contínua (CI)** com GitHub Actions
- **Testes automatizados** integrados no CI
- **Infraestrutura como Código (IaC)** com Terraform (AWS)

Para facilitar a avaliação, o projeto usa uma **API Flask mínima** com endpoints `/` e `/health`.

## 2) Objetivos
1. Padronizar o fluxo de entrega via CI: build, lint e testes a cada push/PR.
2. Garantir feedback rápido sobre a qualidade do código.
3. Versionar e validar infraestrutura (Terraform) com checagens automáticas.

## 3) Requisitos
### 3.1 Funcionais
- Endpoint `/health` deve responder `{"status": "healthy"}`.
- CI deve executar automaticamente:
  - Instalação de dependências
  - Lint (ruff)
  - Testes unitários (pytest)
  - `terraform fmt -check` e `terraform validate`

### 3.2 Não-funcionais
- Repositório com estrutura organizada e documentação clara.
- Pipeline reproduzível (sem etapas manuais para build e testes).

## 4) Estrutura do repositório
```
.
├── app/                 # aplicação
├── tests/               # testes automatizados
├── infra/terraform/      # IaC (Terraform)
└── .github/workflows/   # CI (GitHub Actions)
```

## 5) Como executar localmente
```bash
python -m venv .venv
source .venv/bin/activate
make install
make test
make run
```

## 6) CI (GitHub Actions)
Workflow: `.github/workflows/ci.yml`

Gatilhos:
- `push` e `pull_request` na branch `main`

Jobs:
- `python-ci`: instala dependências, roda lint e testes.
- `terraform-ci`: valida IaC (fmt/validate) sem aplicar mudanças.

## 7) IaC (Terraform / AWS)
Pasta: `infra/terraform`

O Terraform provisiona uma base de infraestrutura (rede + VM) para um ambiente de *staging*:
- VPC + subnet pública + Internet Gateway
- Security Group (SSH restrito por CIDR + HTTP liberado)
- EC2 com `user_data` instalando Docker e executando um Nginx de exemplo

> Observação: nesta fase **não aplicamos automaticamente** a infraestrutura pelo CI (boa prática de segurança). O CI apenas valida e formata.

### Comandos
```bash
cd infra/terraform
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

### Variáveis
Crie um `terraform.tfvars` (não versionado) com, no mínimo:
```hcl
project_name     = "devops-fase1-demo"
aws_region       = "us-east-1"
allowed_ssh_cidr = "SEU_IP/32"
public_key       = "ssh-rsa AAAA..."
```

