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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/leoyats/dotfiles/main/install.sh)"
```

---

## 🔄 Updating the Repository

When you install a new program or modify configuration files, follow these steps to keep your dotfiles in sync:

### 1️⃣ **Adding a New Application**

#### If it's a Homebrew package:
```bash
# Add to Brewfile (or dot_Brewfile in chezmoi source)
brew "package-name"  # or cask "app-name" for GUI apps
```

Then install and commit:
```bash
brew bundle install --file=./Brewfile
git add Brewfile && git commit -m "chore: add package-name"
```

#### If it's a VS Code extension:
```bash
# Add to Brewfile
vscode "publisher.extension-name"
```

Then sync:
```bash
brew bundle install --file=./Brewfile
git add Brewfile && git commit -m "chore: add vscode extension"
```

---

### 2️⃣ **Syncing Configuration Files**

When you modify config files (`.zshrc`, `.wezterm.lua`, etc.):

```bash
# Update the source file in the repository
# (e.g., dot_zshrc, dot_wezterm.lua)

# Make chezmoi track the changes
chezmoi add ~/.zshrc
chezmoi add ~/.config/directory

# Review changes
chezmoi diff

# Commit to git
git add dot_zshrc dot_config/...
git commit -m "chore: update zshrc config"
```

---

### 3️⃣ **Syncing New Application Configs**

When a new app stores config in your home directory:

```bash
# Track the new config file with chezmoi
chezmoi add ~/.newapp/config.yaml

# This creates dot_newapp/config.yaml in the repository

# Apply and test
chezmoi apply

# Commit
git add dot_newapp/
git commit -m "feat: add newapp configuration"
```

---

### 4️⃣ **Updating All Configs from Live System**

To sync all modified files at once:

```bash
# Track any untracked files that have changed
chezmoi add ~/.zshrc ~/.config/* ~/.wezterm.lua

# Review all pending changes
chezmoi diff

# Apply if everything looks good
chezmoi apply

# Commit to git
git status
git add .
git commit -m "chore: sync configs from live system"
```

---

## 📋 Workflow Checklist

- [ ] Install new program: `brew install package` or `cask "app"`
- [ ] Add to `Brewfile`
- [ ] Run `brew bundle install --file=./Brewfile` to verify
- [ ] If app has configs: `chezmoi add ~/.config/app`
- [ ] Review: `chezmoi diff`
- [ ] Apply: `chezmoi apply`
- [ ] Commit: `git add . && git commit -m "msg"`
- [ ] Push: `git push origin main`

---

## 📂 Repository Structure

```
dotfiles/
├── Brewfile              # Homebrew packages & VS Code extensions
├── dot_Brewfile          # chezmoi-managed Brewfile (syncs as .Brewfile)
├── dot_zshrc             # Zsh shell configuration
├── dot_wezterm.lua       # WezTerm terminal configuration
├── dot_config/           # Application configs directory
│   ├── yazi/            # Yazi file manager configs
│   └── btop/            # btop system monitor configs
└── install.sh            # Bootstrap script
```

**Note:** Files prefixed with `dot_` are managed by chezmoi and deployed with a leading dot (`.`) in the home directory.