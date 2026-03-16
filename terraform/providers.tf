terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  # Deixe vazio. O provider vai ler as envs PM_... diretamente.
    pm_tls_insecure = true
}