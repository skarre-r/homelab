terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://127.0.0.1:8006/api2/json"
}

variable "proxmox_user" {
  description = "Proxmox username"
  type        = string
  default     = "root@pam"
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "proxmox_node_name" {
  description = "Proxmox node (host)name"
  type        = string
  default     = "proxmox"
}

provider "proxmox" {
  pm_api_url    = var.proxmox_api_url
  pm_user       = var.proxmox_user
  pm_password   = var.proxmox_password
  pm_log_enable = true
}

resource "proxmox_vm_qemu" "proxmox_truenas_vm" {
  target_node = var.proxmox_node_name
  name        = "truenas"
  desc        = "TrueNAS Core VM"
  iso         = "truenas.iso"  # TODO
  vmid        = 0
  agent       = 1
  cores       = 2
  memory      = 32000
}

resource "proxmox_vm_qemu" "proxmox_debian_vm" {
  target_node = var.proxmox_node_name
  name        = "k8s"
  desc        = "Debian K8S VM"
  iso         = "debian.iso"  # TODO
  vmid        = 1
  agent       = 1
  cores       = 2
  memory      = 16000
}