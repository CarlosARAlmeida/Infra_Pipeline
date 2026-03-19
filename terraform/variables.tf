variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

#variable "ssh_public_key" {
#  type        = string
#  description = "Chave publica para as VMs"
#}

variable "ssh_public_key_ansible" {
  description = "Chave pública para o robô do Ansible"
  type        = string
}

variable "ssh_public_key_admin" {
  description = "Sua chave pública pessoal de Admin"
  type        = string
}