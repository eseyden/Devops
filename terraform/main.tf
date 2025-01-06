variable "container_password" {
    type      = string
    sensitive = true
}

resource "proxmox_lxc" "caddy_reverse_proxy" {
  hostname    = "apps.fatalexe.com"
  target_node = "pve" 
  ostemplate  = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  memory      = 4096
  cores       = 4
  password    = var.container_password
  start       = true

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name      = "eth0"
    bridge    = "vmbr0"
    ip        = "dhcp"
  }
}
