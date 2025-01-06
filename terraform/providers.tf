variable "pm_password" {
    type      = string
    sensitive = true
}

terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url  = "https://192.168.68.57:8006/api2/json"
  pm_user  = "root@pam"
  pm_password  = var.pm_password
  pm_tls_insecure  = true
}