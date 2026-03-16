# Base balanceada entre segurança e compatibilidade
FROM myoung34/github-runner:2.332.0

USER root

# 1. Instalação de dependências básicas e repositórios
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    gnupg \
    software-properties-common \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 2. Instalação do Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install -y terraform

# 3. Instalação do Ansible
RUN apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible

# 4. Instalação de coleções necessárias para o Ansible (opcional, mas recomendado)
# Exemplo: comunidade para interagir com Docker ou Proxmox via API
RUN ansible-galaxy collection install community.general

# Voltando para o usuário padrão do runner por segurança
USER runner

ENTRYPOINT ["/entrypoint.sh"]