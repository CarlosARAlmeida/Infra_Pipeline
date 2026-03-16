variable "proxmox_api_url" {
  type    = string
  default = "" # Garante que a variável exista, mesmo que vazia
}

# Mudamos de 'proxmox_api_token' para estas duas abaixo:
variable "proxmox_api_token_id" {
  type        = string
  description = "ID do Token (Ex: root@pve!meutoken)"
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "O Secret UUID do Token"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "Chave publica para as VMs"
}