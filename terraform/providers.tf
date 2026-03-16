terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4" # Versão estável e compatível
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id # Note que o nome mudou um pouco
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}
