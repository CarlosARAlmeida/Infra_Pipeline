resource "proxmox_vm_qemu" "k8s_master" {
  name        = "k8s-master-01"
  target_node = "pve02" # Nome do seu nó Proxmox
  clone       = "ubuntu-2404-cloud-init" # NOME do seu template (não o ID)
  vmid        = 100
  
  cores   = 4
  memory  = 4096
  agent   = 1 # Habilite se tiver o qemu-guest-agent no template

  network {
    id      = 0
    model  = "virtio"
    bridge = "vmbr1"
  }

  ipconfig0 = "ip=172.22.0.29/23,gw=172.22.0.1" # Ajuste o IP e Gateway
  sshkeys   = var.ssh_public_key
}

resource "proxmox_vm_qemu" "k8s_workers" {
  count       = 2
  name        = "k8s-worker-0${count.index + 1}"
  target_node = "pve02"
  clone       = "ubuntu-2404-cloud-init"
  full_clone = true
  vmid        = 100 + count.index
  
  cores   = 2
  memory  = 2048

  network {
    id      = 0
    model  = "virtio"
    bridge = "vmbr1"
  }

  ipconfig0 = "ip=172.22.0.30${count.index}/24,gw=172.22.0.1"
  sshkeys   = var.ssh_public_key
}

