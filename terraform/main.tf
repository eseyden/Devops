variable "container_password" {
    type      = string
    sensitive = true
}

resource "proxmox_lxc" "test_ct" {
  hostname    = "hello"
  target_node = "pve" 
  ostemplate  = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name      = "eth0"
    bridge    = "vmbr0"
    ip        = "dhcp"
  }

  memory = 1024
  cores = 1

  password = var.container_password
}
