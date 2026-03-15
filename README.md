# Template – Fase 1 – DevOps na Prática (Configuração e Automação Inicial)

> **Link do repositório:**  
> `https://github.com/AssueroMeira/devops-fase1-demo`

## 1) Descrição do projeto

Este repositório apresenta a entrega da **Fase 1** do projeto **“DevOps na Prática”**, com foco em **configuração e automação inicial**.

A solução contempla os principais itens exigidos nesta etapa:

- Pipeline de **Integração Contínua (CI)** com **GitHub Actions**
- **Testes automatizados** integrados ao pipeline
- **Infraestrutura como Código (IaC)** com **Terraform**
- Estrutura organizada para facilitar versionamento, validação e evolução do projeto

Para fins didáticos e de validação técnica, o projeto utiliza uma **API Flask mínima**, com endpoints simples para demonstrar a automação de verificações no pipeline.

---

## 2) Objetivos

Os objetivos deste projeto são:

1. Implementar um fluxo de **integração contínua** para validar automaticamente o código a cada `push` e `pull request`.
2. Garantir **feedback rápido** sobre qualidade do código por meio de lint e testes automatizados.
3. Versionar e validar a infraestrutura utilizando **Terraform**, aplicando os princípios de **Infraestrutura como Código**.
4. Organizar a base do projeto de forma clara, reprodutível e alinhada às práticas introdutórias de DevOps.

---

## 3) Requisitos

### 3.1 Requisitos funcionais

- A aplicação deve disponibilizar um endpoint `/health`.
- O endpoint `/health` deve retornar uma resposta indicando funcionamento correto da aplicação.
- O pipeline de CI deve executar automaticamente:
  - instalação das dependências
  - lint com `ruff`
  - testes automatizados com `pytest`
  - validação de formatação do Terraform
  - validação sintática da infraestrutura definida em Terraform

### 3.2 Requisitos não funcionais

- O repositório deve possuir estrutura organizada e documentação clara.
- O pipeline deve ser reproduzível e automatizado.
- O projeto deve separar adequadamente:
  - aplicação
  - testes
  - pipeline
  - infraestrutura
- A infraestrutura deve ser validada sem aplicação automática no ambiente real.

---

## 4) Estrutura do repositório

```text
.
├── app/                  # aplicação Flask
├── tests/                # testes automatizados
├── infra/terraform/      # infraestrutura como código (Terraform)
└── .github/workflows/    # pipeline de CI no GitHub Actions
```

---

## 5) Como executar localmente

### 5.1 Linux/macOS

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
ruff check .
pytest -q
python app/main.py
```

### 5.2 Windows (Git Bash)

```bash
python -m venv .venv
source .venv/Scripts/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
ruff check .
pytest -q
python app/main.py
```

### 5.3 Windows (PowerShell)

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
ruff check .
pytest -q
python app/main.py
```

### 5.4 Windows (CMD)

```cmd
python -m venv .venv
.venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
ruff check .
pytest -q
python app/main.py
```

Após executar a aplicação, ela ficará disponível em:

```text
http://localhost:5000
```

---

## 6) Integração Contínua (GitHub Actions)

O pipeline de CI está definido no arquivo:

```text
.github/workflows/ci.yml
```

### 6.1 Gatilhos

O workflow é executado automaticamente nos seguintes eventos:

- `push` na branch `main`
- `pull_request` na branch `main`

### 6.2 Jobs do pipeline

#### `python-ci`

Responsável por validar a aplicação Python. Executa as seguintes etapas:

- checkout do código
- configuração do Python
- instalação das dependências
- lint com `ruff`
- execução dos testes com `pytest`

#### `terraform-ci`

Responsável por validar a infraestrutura como código. Executa as seguintes etapas:

- checkout do código
- instalação do Terraform
- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate`

### 6.3 Objetivo do pipeline

O objetivo do pipeline é garantir que qualquer alteração enviada ao repositório seja automaticamente verificada, reduzindo falhas e melhorando a confiabilidade do projeto.

---

## 7) Infraestrutura como Código (Terraform)

A infraestrutura está definida na pasta:

```text
infra/terraform
```

O projeto utiliza **Terraform** para descrever a infraestrutura de forma declarativa e versionável.

### 7.1 Componentes previstos

A estrutura de infraestrutura contempla uma base para ambiente de **staging**, incluindo:

- **VPC**
- **Subnet pública**
- **Internet Gateway**
- **Route Table**
- **Security Group**
  - SSH restrito por CIDR informado
  - HTTP liberado
- **Key Pair**
- **Instância EC2**
  - com `user_data` para instalação de Docker
  - execução de um container Nginx de exemplo

### 7.2 Observação importante

Nesta fase, a infraestrutura **não é aplicada automaticamente pelo CI**.

O pipeline executa apenas:

- validação de formatação
- inicialização local do Terraform sem backend remoto
- validação sintática da configuração

Essa abordagem é adequada para a fase inicial do projeto e evita alterações automáticas em ambiente real.

### 7.3 Comandos úteis

```bash
cd infra/terraform
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

> **Observação:** para executar `terraform plan`, é necessário possuir credenciais da AWS configuradas localmente.

### 7.4 Variáveis

Crie um arquivo `terraform.tfvars` localmente, sem versioná-lo, por exemplo:

```hcl
project_name     = "devops-fase1-demo"
aws_region       = "us-east-1"
allowed_ssh_cidr = "SEU_IP/32"
public_key       = "ssh-rsa AAAA..."
```

---

## 8) Testes automatizados

O projeto inclui testes automatizados para validar o comportamento esperado da aplicação.

Os testes estão localizados na pasta:

```text
tests/
```

Eles são executados automaticamente no pipeline de CI com `pytest`, garantindo que a aplicação permaneça estável após cada alteração enviada ao repositório.

---

## 9) Tecnologias utilizadas

As principais tecnologias e ferramentas utilizadas neste projeto são:

- **Python**
- **Flask**
- **Pytest**
- **Ruff**
- **GitHub Actions**
- **Terraform**
- **AWS**

---

## 10) Evidências da entrega

Este projeto contempla os itens exigidos para a **Fase 1**:

- documentação de planejamento
- repositório GitHub configurado
- pipeline de integração contínua funcional
- testes automatizados implementados e integrados
- scripts de infraestrutura como código com Terraform

---

## 11) Repositório publicado

Repositório disponível em:

`https://github.com/AssueroMeira/devops-fase1-demo`
