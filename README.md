# 💻 leoyats' Dotfiles 🚀

![macOS](https://img.shields.io/badge/OS-macOS%20Sequoia-000000?style=for-the-badge&logo=apple)
![Shell](https://img.shields.io/badge/Shell-Zsh-blue?style=for-the-badge&logo=zsh)
![Terminal](https://img.shields.io/badge/Terminal-WezTerm-black?style=for-the-badge&logo=wezterm)
![Package Manager](https://img.shields.io/badge/Managed%20by-Homebrew-ffde00?style=for-the-badge&logo=homebrew)

My personal development environment for **MacOS**. 
Fully automated setup: from system utilities and GUI apps to VS Code extensions, all managed via Homebrew and synced with chezmoi.

---

## 🛠 Tech Stack

| Category | Tool | Description |
| :--- | :--- | :--- |
| **Dotfiles** | [chezmoi](https://www.chezmoi.io/) | Secure dotfiles manager for tracking and syncing configs |
| **Package Management** | [Homebrew](https://brew.sh) | Automated installation of **Formulae, Casks & VS Code Extensions** |
| **Terminal** | [WezTerm](https://wezfurlong.org/wezterm/) | GPU-accelerated terminal emulator with Lua configuration |
| **Shell** | [Zsh](https://www.zsh.org/) + P10k | Powerlevel10k theme with autosuggestions & highlighting |
| **File Manager** | [Yazi](https://yazi-rs.github.io/) | Blazing fast terminal file manager written in Rust |
| **Monitoring** | [btop](https://github.com/aristocratos/btop) | Modern and informative system resource monitor |

---

## ✨ Features
* **Full Automation:** One `chezmoi apply` installs everything from browsers to mouse drivers using Brewfile.
* **Modern CLI:** Replaces standard utilities with modern alternatives (`bat`, `ripgrep`, `fastfetch`, `fzf`, `zoxide`).
* **VS Code Sync:** Essential extensions (Jupyter, Python, Markdown) are pre-defined in the `Brewfile`.
* **Zero-to-Hero:** Reproduce this exact workflow on any fresh macOS machine in minutes.

---

## 🚀 Quick Start (One-line install)

To bootstrap this setup on a fresh macOS machine, first install [Homebrew](https://brew.sh), then run:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply leoyats