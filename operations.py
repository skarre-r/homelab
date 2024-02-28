"""
'pyinfra' operations module.
"""

from __future__ import annotations

__all__ = []

from pyinfra import host, logger
from pyinfra.facts.files import FindFiles
from pyinfra.facts.server import Hostname

hostname: str = host.get_fact(name_or_cls=Hostname)


def download_iso_files() -> None:
    """
    Download ISO files on the Proxmox server.
    """
    proxmox_iso_file_directory: str = "/var/lib/vz/template/iso"
    iso_files: list[str] = host.get_fact(
        name_or_cls=FindFiles, path=proxmox_iso_file_directory
    )
    logger.info("ISO files: %s", iso_files)
    if not any("debian" in file_name.lower() for file_name in iso_files):
        ...
    if not any("truenas" in file_name.lower() for file_name in iso_files):
        ...


match hostname:
    case "proxmox":
        download_iso_files()
    case _:
        logger.warning("No operations configured for this host. (%s)", hostname)
