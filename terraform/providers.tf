terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4" # Versão estável que estávamos usando
    }
  }
}

provider "proxmox" {
  # URL completa com /api2/json
  pm_api_url          = "https://192.168.98.38:8006"
  
  # ID completo: usuario@realm!nome_do_token
  pm_api_token_id     = "terraform-prov@pve!terraform-token"
  
  # O Secret UUID (Aquele que começa com ef8cc0f4...)
  pm_api_token_secret = "e24857b0-6794-4a33-9a28-63bfdf580a8b"

  pm_tls_insecure     = true
  # Remova ou comente as outras linhas que estavam aqui
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