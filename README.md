# Personal Development Environment

Source-controlled configuration for developer tools across machines and operating systems (Windows + WSL).

---

## Philosophy

1. **Portability** — every config works across Windows (Git Bash) and WSL with minimal adjustments
2. **Simplicity** — fewer abstractions, maximum clarity
3. **Craftsmanship** — treat your environment as a crafted tool that grows with you

---

## Repository Structure

```
dev-config/
├── neovim/           # Neovim Lua configuration (cross-platform)
├── powershell/       # PowerShell profile (Aline Sky colors)
├── starship/         # Starship prompt (environment-aware)
├── wezterm/          # WezTerm terminal (multi-shell launcher)
└── zed/              # Zed editor configs
```

---

## Quick Setup

### Prerequisites

**Windows (via scoop):**
```bash
scoop install git neovim starship gh
scoop bucket add nerd-fonts
scoop install Cousine-NF-Mono
```

**WSL (Ubuntu):**
```bash
sudo apt install build-essential unzip
sudo snap install nvim --classic
# Install starship
curl -sS https://starship.rs/install.sh | sh
```

### Symlinks

**Windows (PowerShell as Administrator):**

First, set the repo root (adjust to your checkout location):
```powershell
$DEVCONFIG = "$env:USERPROFILE\dev\repos\dev-config"  # adjust if needed
```

Then create symlinks:
```powershell
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\starship.toml" -Target "$DEVCONFIG\starship\starship.toml" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wezterm.lua" -Target "$DEVCONFIG\wezterm\wezterm.lua" -Force
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$DEVCONFIG\neovim" -Force
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$DEVCONFIG\powershell\Microsoft.PowerShell_profile.ps1" -Force
```

**WSL:**

```bash
DEVCONFIG=~/dev/repos/dev-config  # adjust if needed

mkdir -p ~/.config
ln -sf "$DEVCONFIG/starship/starship.toml" ~/.config/starship.toml
ln -sf "$DEVCONFIG/neovim" ~/.config/nvim
```

Add to `~/.bashrc` (WSL):
```bash
eval "$(starship init bash)"
```

---

## Components

### Starship (`starship/starship.toml`)

Cross-platform prompt with automatic environment detection:

| Environment | Icon | Detection |
|-------------|------|-----------|
| Git Bash (Windows) | 🪟 | `$MSYSTEM` env var |
| WSL | 🐧 | `$WSL_DISTRO_NAME` env var |
| PowerShell | ⚡ | `[shell]` module |
| CMD | 📟 | `[shell]` module |

Also shows: git branch/status, language versions (Rust 🦀, Python, Lua, Node), command duration.

Color palette: **Aline Sky** — shared across all tools.

### WezTerm (`wezterm/wezterm.lua`)

Multi-shell terminal with Aline Sky color palette.

**Launch menu** (`Alt+L`): pick any shell environment.

**Quick spawn shortcuts:**
| Shortcut | Action |
|----------|--------|
| `Alt+Shift+W` | New WSL tab |
| `Alt+Shift+B` | New Git Bash tab |
| `Alt+Shift+P` | New PowerShell tab |
| `Alt+T` | New tab (same shell) |
| `Alt+H` | Split horizontal |
| `Alt+V` | Split vertical |
| `Alt+X` | Close pane |
| `Alt+[/]` | Switch tabs |
| `Alt+Arrows` | Navigate panes |

Tab titles show environment icon + current directory.

Font: **Cousine Nerd Font Mono** (install via `scoop install Cousine-NF-Mono`).

### PowerShell (`powershell/Microsoft.PowerShell_profile.ps1`)

Minimal profile: starship init + PSReadLine colors matched to Aline Sky palette.

### Neovim (`neovim/`)

Full cross-platform Lua configuration. See `neovim/README.md` for details.

### AutoHotkey (`autohotkey/`)

Windows keyboard utilities. `lang-switch.ahk` keeps English/Russian on a single
key (`CapsLock`) and moves the Portuguese layout to a separate hotkey
(`Ctrl+Shift+P`). See `autohotkey/readme.md`.

---

## Windows Installation Policy

All Windows tools should be installed via **scoop**:

```bash
scoop install <package>
```

Useful buckets:
```bash
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts
```

---

## Aline Sky Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Background | `#1E1F29` | Terminal bg |
| Rose Haze | `#FFD6E0` | Errors, warnings |
| Mint Glow | `#A8E6CF` | Success, numbers |
| Warm Cream | `#F2E9E4` | Strings |
| Twilight Blue | `#6A8CDF` | Commands, keywords |
| Lavender Blush | `#DDBDD5` | Keywords, shell |
| Soft Sky | `#C3C7F7` | Parameters, directories |
| Lavender Mist | `#E5D9F2` | Foreground text |
| Muted Gray | `#3F3F4A` | Comments, selections |

---

## License

MIT License - feel free to use and adapt for your own setup.