terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07" # Versão com suporte oficial ao PVE 9
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