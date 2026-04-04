# 💻 leoyats' Dotfiles 🚀

![macOS](https://img.shields.io/badge/OS-macOS%20Sequoia-000000?style=for-the-badge&logo=apple)
![Shell](https://img.shields.io/badge/Shell-Zsh-blue?style=for-the-badge&logo=zsh)
![Terminal](https://img.shields.io/badge/Terminal-WezTerm-black?style=for-the-badge&logo=wezterm)
![Package Manager](https://img.shields.io/badge/Managed%20by-Homebrew-ffde00?style=for-the-badge&logo=homebrew)

My personal development environment for **macOS**. 
A fully automated "Zero-to-Hero" setup: from core system utilities and GUI apps to VS Code extensions, all managed via Homebrew and kept in sync with chezmoi.

---

## 🛠 Tech Stack

| Category | Tool | Description |
| :--- | :--- | :--- |
| **Automation** | [Bootstrap Script](https://github.com/leoyats/dotfiles/blob/main/install.sh) | One-command setup for fresh systems |
| **Dotfiles** | [chezmoi](https://www.chezmoi.io/) | Secure dotfiles manager for tracking and syncing configs |
| **Package Management** | [Homebrew](https://brew.sh) | Automated installation of **Formulae, Casks & VS Code Extensions** |
| **Terminal** | [WezTerm](https://wezfurlong.org/wezterm/) | GPU-accelerated terminal emulator with Lua configuration |
| **Shell** | [Zsh](https://www.zsh.org/) + P10k | Powerlevel10k theme with autosuggestions & highlighting |
| **File Manager** | [Yazi](https://yazi-rs.github.io/) | Blazing fast terminal file manager written in Rust |
| **Monitoring** | [btop](https://github.com/aristocratos/btop) | Modern and informative system resource monitor |

---

## ✨ Features
* **One-Click Setup:** A master bootstrap script that installs Homebrew, chezmoi, and all your apps in one go.
* **Full App Library:** Managed via `Brewfile` — installs everything from CLI tools (`bat`, `fzf`, `zoxide`) to GUI apps (Chrome, VS Code, Telegram).
* **VS Code Sync:** Essential extensions (Jupyter, Python, Markdown, Gemini) are automatically installed.
* **Modern Workflow:** Highly optimized for speed, aesthetics, and efficiency on Apple Silicon.

---

## 🚀 Quick Start (One-line install)

To bootstrap this entire environment on a fresh macOS machine, simply open your terminal and run:

```bash
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/leoyats/dotfiles/main/install.sh](https://raw.githubusercontent.com/leoyats/dotfiles/main/install.sh))"