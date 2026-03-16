variable "proxmox_api_url" {
  type        = string
  description = https://192.168.98.38:8006/api2/json
}

variable "proxmox_api_token" {
  type        = string
  description = "Token de API (ID=Secret)"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "Sua chave pública para injetar nas VMs via Cloud-init"
}