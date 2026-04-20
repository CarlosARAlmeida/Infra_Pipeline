Projeto Infra Pipeline Proxmox

- IaC, com Terraform faz o provisionamento de 3 servidores no proxmox via API.
- Ansible faz a configuração, padronização e instalação do cluster Kubernetes (1 master e 2 nodes).
- Observabilidade: Ansible faz o deploy do Grafana, Prometheus, Loki e Jaeger para stack de observabilidade.
- Aplicação: Ansible faz o deploy de uma aplicação com backend, frontend e banco de dados.

Tudo automatizado em uma esteira CI/CD, utilizando GitHub Actions.

<img width="1101" height="618" alt="Captura de Tela 2026-04-20 às 16 02 04" src="https://github.com/user-attachments/assets/9c632e90-9030-432a-af12-6207b3823084" />


Motivação para o desenvolvimento deste projeto é aprofundar os estudos nas ferramentas utilizadas e usar como base de estudo para Kubernetes e Stack de Observabilidade.
