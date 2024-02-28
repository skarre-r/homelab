"""
'pyinfra' inventory module.
"""

from __future__ import annotations

__all__ = ["hosts", "virtual_machines"]

hosts: list[str] = ["proxmox"]
virtual_machines: list[str] = []
