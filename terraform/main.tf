# Definição da VM Master
resource "proxmox_virtual_machine" "k8s_master" {
  name        = "k8s-master-01"
  description = "Kubernetes Control Plane"
  node_name   = "pve" # Nome do seu nó no Proxmox
  vm_id       = 100

  clone {
    vm_id = 9001 # ID do seu template Cloud-init
  }

  cpu {
    cores = 4
  }

  memory {
    dedicated = 4096
  }

  network_device {
    bridge = "vmbr1"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "172.22.0.29/23" 
        gateway = "172.22.0.1"
      }
    }
    user_account {
      keys     = [var.ssh_public_key]
      username = "ansible"
    }
  }
}

# Definição dos Workers (Escalável)
resource "proxmox_virtual_machine" "k8s_workers" {
  count       = 2
  name        = "k8s-worker-0${count.index + 1}"
  node_name   = "pve"
  vm_id       = 110 + count.index

  clone {
    vm_id = 9001
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr1"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "172.22.0.30${count.index}/23"
        gateway = "172.22.0.1"
      }
    }
    user_account {
      keys     = [var.ssh_public_key]
      username = "ansible"
    }
  }
}