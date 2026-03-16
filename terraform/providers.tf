terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.1" # Verifique a última versão estável
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
  api_token = var.proxmox_api_token
  insecure  = true # Setar como true se você usa certificado auto-assinado (comum em labs)

  ssh {
    agent = true
    # O Terraform usa SSH para algumas operações de provisionamento
    username = "root" 
  }
}