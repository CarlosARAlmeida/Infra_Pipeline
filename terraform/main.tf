# Definição do Master
resource "proxmox_vm_qemu" "k8s_master" {
  name        = "k8s-master-01"
  target_node = "pve02"
  clone       = "ubuntu-2404-template"
  vmid        = 200
  agent = 1
  full_clone  = true
  scsihw = "virtio-scsi-single"
  bootdisk    = "scsi0"

  # --- O BLOCO QUE RESOLVE O 'UNUSED DISK' ---
  disk {
    slot     = "scsi0"
    size     = "20G"        # Tamanho desejado (deve ser >= ao do template)
    type     = "disk"
    storage  = "local-lvm"  # Nome exato do seu storage
    iothread = true
  }
  # -------------------------------------------

# Disco de Cloud-Init (ADICIONE ISTE)
  disk {
    slot     = "ide2"
    type     = "cloudinit"
    storage  = "local-lvm"
  }

  vga {
    type = "std"
  }

  serial {
    id   = 0
    type = "socket"
  }

  cpu {
    cores = 4
    type  = "host"
  }

  memory = 4096

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"
    tag    = 120
  }

  ipconfig0 = "ip=172.22.0.29/23,gw=172.22.0.1"
  # Atualização das Chaves (Injetando os dois cadeados)
  sshkeys = <<EOF
${var.ssh_public_key_ansible}
${var.ssh_public_key_admin}
EOF
  }

# Definição dos Workers
resource "proxmox_vm_qemu" "k8s_workers" {
  count       = 2
  name        = "k8s-worker-0${count.index + 1}"
  target_node = "pve02"
  clone       = "ubuntu-2404-template"
  full_clone  = true
  scsihw = "virtio-scsi-single"

# --- O BLOCO QUE RESOLVE O 'UNUSED DISK' ---
  disk {
    slot     = "scsi0"
    size     = "20G"        # Tamanho desejado (deve ser >= ao do template)
    type     = "disk"
    storage  = "local-lvm"  # Nome exato do seu storage
    iothread = true
  }
  # -------------------------------------------
  bootdisk    = "scsi0"

# Disco de Cloud-Init (ADICIONE ISTE)
  disk {
    slot     = "ide2"
    type     = "cloudinit"
    storage  = "local-lvm"
  }

  # IDs 201 e 202 para evitar o erro de 'ID 100 em uso'
  vmid        = 201 + count.index

  agent = 1

  vga {
    type = "std"
  }

  serial {
    id   = 0
    type = "socket"
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory = 2048

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"
    tag    = 120
  }

  # Lógica de IP: Resultará em 172.22.0.30 e 172.22.0.31
  # Usei /23 para bater com o Master
  ipconfig0 = "ip=172.22.0.${30 + count.index}/23,gw=172.22.0.1"
  # Atualização das Chaves (Injetando os dois cadeados)
  sshkeys = <<EOF
${var.ssh_public_key_ansible}
${var.ssh_public_key_admin}
EOF
}