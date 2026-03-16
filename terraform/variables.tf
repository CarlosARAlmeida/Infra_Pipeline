variable "proxmox_api_url" {
  type        = string
  description = "URL da API do Proxmox (Ex: https://ip-do-servidor:8006/api2/json)"
}

variable "proxmox_api_token" {
  type        = string
  description = "Token de API do Proxmox"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "Chave publica para as VMs"
}
