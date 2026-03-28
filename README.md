# 💻 leoyats' Dotfiles 🚀

![macOS](https://img.shields.io/badge/OS-macOS%20Sequoia-000000?style=for-the-badge&logo=apple)
![Shell](https://img.shields.io/badge/Shell-Zsh-blue?style=for-the-badge&logo=zsh)
![Terminal](https://img.shields.io/badge/Terminal-WezTerm-black?style=for-the-badge&logo=wezterm)
![Built with](https://img.shields.io/badge/Built%20with-Rust-orange?style=for-the-badge&logo=rust)

My personal development environment for **MacBook Pro M4 Max (2024)**. 
Highly optimized for speed, aesthetics, and a seamless terminal workflow.

---

## 🛠 Tech Stack

| Category | Tool | Description |
| :--- | :--- | :--- |
| **Terminal** | [WezTerm](https://wezfurlong.org/wezterm/) | GPU-accelerated terminal emulator with Lua config |
| **Shell** | [Zsh](https://www.zsh.org/) + P10k | Powerlevel10k theme with autosuggestions & highlighting |
| **File Manager** | [Yazi](https://yazi-rs.github.io/) | Blazing fast terminal file manager written in Rust |
| **Dotfiles** | [chezmoi](https://www.chezmoi.io/) | Secure and efficient dotfiles manager |

---

## 🚀 Quick Start (One-line install)

To bootstrap this setup on a fresh macOS machine, install [Homebrew](https://brew.sh) and run:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply leoyats