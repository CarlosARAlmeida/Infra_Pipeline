terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14" # <--- ESTA VERSÃO É A SOLUÇÃO
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://192.168.98.38:8006/api2/json"
  pm_api_token_id     = "carlos@pam!terraform"
  pm_api_token_secret = "285c9657-f0e3-44ad-9679-f0f3af495cc3"
  pm_tls_insecure     = true
}

# terraform {
#   required_providers {
#     proxmox = {
#       source  = "Telmate/proxmox"
#       version = "3.0.1-rc4"
#     }
#   }
# }

# provider "proxmox" {
#   # Deixe vazio. O provider vai ler as envs PM_... diretamente.
#     pm_tls_insecure = true
# }