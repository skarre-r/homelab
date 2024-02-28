from __future__ import annotations

__all__ = ["ssh_password", "ssh_hostname", "ssh_user", "ssh_port"]

import os

from dotenv import load_dotenv

load_dotenv()

ssh_hostname: str = os.environ.get("PYINFRA_PROXMOX_SSH_HOST", "127.0.0.1")
ssh_port: int = int(os.environ.get("PYINFRA_PROXMOX_SSH_PORT", 22))
ssh_user: str = os.environ.get("PYINFRA_PROXMOX_SSH_USER", "root")
ssh_password: str | None = os.environ.get("PYINFRA_PROXMOX_SSH_PASSWORD", None)
