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
  pm_api_token_id     = "terraform-prov@pve!terraform-token"
  pm_api_token_secret = "deb30691-5175-49ee-9c05-8f5810d4f6fc"
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