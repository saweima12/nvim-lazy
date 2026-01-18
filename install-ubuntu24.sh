#!/usr/bin/env bash
set -euo pipefail

# Installs CLI dependencies for this Neovim config on Ubuntu 24.04.
# Packages:
# - fd (Ubuntu package: fd-find; binary: fdfind)
# - ripgrep
# - fzf

if [[ "${EUID}" -eq 0 ]]; then
  echo "Please run as a normal user (will use sudo when needed)." >&2
  exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
  echo "sudo is required but not found." >&2
  exit 1
fi

if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  . /etc/os-release
else
  echo "Cannot detect OS (missing /etc/os-release)." >&2
  exit 1
fi

if [[ "${ID:-}" != "ubuntu" ]]; then
  echo "This script currently supports Ubuntu only (detected: ${ID:-unknown})." >&2
  exit 1
fi

# Ubuntu 24.04 is VERSION_ID=24.04; allow future 24.xx as well.
if [[ "${VERSION_ID:-}" != 24.* ]]; then
  echo "This script is intended for Ubuntu 24.xx (detected VERSION_ID=${VERSION_ID:-unknown})." >&2
  exit 1
fi

if [[ ! -t 0 ]]; then
  echo "This script needs an interactive terminal for sudo." >&2
  echo "Run it locally with: ./install-ubuntu24.sh" >&2
  exit 1
fi

echo "Updating apt metadata..."
sudo apt-get update

echo "Installing: fd (fd-find), ripgrep, fzf"
sudo apt-get install -y fd-find ripgrep fzf

# fd is packaged as fd-find and provides 'fdfind'. Most tools expect 'fd'.
if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
  echo "Creating user-local symlink: ~/.local/bin/fd -> $(command -v fdfind)"
  mkdir -p "${HOME}/.local/bin"
  ln -sf "$(command -v fdfind)" "${HOME}/.local/bin/fd"

  if [[ ":${PATH}:" != *":${HOME}/.local/bin:"* ]]; then
    echo "NOTE: ~/.local/bin is not in PATH for this shell."
    echo "      Add this to your shell rc (e.g. ~/.bashrc or ~/.zshrc):"
    echo "      export PATH=\"${HOME}/.local/bin:\$PATH\""
  fi
fi

echo "Done. Installed versions:"
fd --version 2>/dev/null || true
rg --version | head -n 1 2>/dev/null || true
fzf --version 2>/dev/null || true
