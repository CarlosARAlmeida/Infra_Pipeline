Projeto Infra Pipeline Proxmox

- IaC em um hypervisor Proxmox.
- Terraform
- Ansible
- Github Actions Runner
- O Deploy da aplicação em um cluter kubernetes.


# Infra_Pipeline
Infraestrutura Pipeline Proxmox
Infra_Pipeline/
├── .github/
│   └── workflows/
│       └── pipeline.yml          # O "cérebro" do CI/CD
├── terraform/                    # Camada de Infraestrutura (IaC)
│   ├── main.tf                   # Definição das VMs no Proxmox
│   ├── variables.tf              # Variáveis (Cores, RAM, IPs)
│   ├── providers.tf              # Configuração do Proxmox Provider
│   ├── outputs.tf                # Saída de dados (ex: IPs das VMs criadas)
│   └── terraform.tfvars.example  # Exemplo de credenciais (não versionar o real)
├── ansible/                      # Camada de Configuração (Provisioning)
│   ├── inventory.ini             # IPs das máquinas (pode ser gerado pelo Terraform)
│   ├── playbook.yml              # Playbook principal para instalar o K3s
│   ├── roles/                    # Roles reutilizáveis (K3s-setup, Docker, etc)
│   └── ansible.cfg               # Configurações do Ansible
├── kubernetes/                   # Camada de Aplicação (Manifestos K8s)
│   ├── deployment.yml            # Definição da aplicação web
│   ├── service.yml               # Exposição da porta (NodePort ou LoadBalancer)
│   └── ingress.yml               # (Opcional) Regras de domínio
├── runner/                       # Configuração do seu Runner Local
│   ├── Dockerfile                # O arquivo que criamos no passo anterior
│   └── docker-compose.yml        # Para subir o runner no seu host Proxmox
├── app/                          # Código fonte da sua página web
│   └── index.html                # Página simples
└── README.md                     # Documentação do projeto