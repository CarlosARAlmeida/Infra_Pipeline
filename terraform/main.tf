# Definição do Master
resource "proxmox_vm_qemu" "k8s_master" {
  name        = "k8s-master-01"
  target_node = "pve02"
  clone       = "ubuntu-2404-cloud-init"
  vmid        = 200
  agent = 1
  full_clone  = true # Recomendado para não depender do template após o deploy

  vga {
    type = "std"
  }

  cpu {
    cores = 4
    type  = "host"
  }

  memory = 4096
  agent  = 1 # Agora dentro do bloco correto

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1" # Certifique-se que a vmbr1 existe no pve02
  }

  serial {
    id   = 0
    type = "socket"
  }

  # Cloud-init: IP estático e Chave SSH
  ipconfig0 = "ip=172.22.0.29/23,gw=172.22.0.1"
  sshkeys   = var.ssh_public_key
}

# Definição dos Workers
resource "proxmox_vm_qemu" "k8s_workers" {
  count       = 2
  name        = "k8s-worker-0${count.index + 1}"
  target_node = "pve02"
  clone       = "ubuntu-2404-cloud-init"
  full_clone  = true
  
  # IDs 201 e 202 para evitar o erro de 'ID 100 em uso'
  vmid        = 201 + count.index

  cpu {
    cores = 2
    type  = "host"
  }

  memory = 2048
  agent  = 1

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"
  }

  # Lógica de IP: Resultará em 172.22.0.30 e 172.22.0.31
  # Usei /23 para bater com o Master
  ipconfig0 = "ip=172.22.0.${30 + count.index}/23,gw=172.22.0.1"
  sshkeys   = var.ssh_public_key
}