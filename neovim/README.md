# Neovim Configuration

Cross-platform Neovim config for Windows and WSL (Ubuntu).
Part of [dev-config](https://github.com/dev-config).

## Prerequisites

### Windows

| Tool | Install | Notes |
|------|---------|-------|
| Neovim | `scoop install neovim` | v0.11+ recommended |
| Python 3 | `scoop install python` | Required for pyright, ruff |
| CMake | `scoop install cmake` | Required to build telescope-fzf-native |
| MinGW | `scoop install mingw` | C compiler required by CMake for telescope-fzf-native |
| Git | `scoop install git` | |
| ripgrep | `scoop install ripgrep` | Required for Telescope live_grep |

### WSL (Ubuntu)

| Tool | Install | Notes |
|------|---------|-------|
| Neovim | `sudo snap install nvim --classic` | v0.11+ recommended |
| build-essential | `sudo apt install -y build-essential` | gcc + make for telescope-fzf-native |
| unzip | `sudo apt install -y unzip` | Required by Mason to extract packages |
| python3-venv | `sudo apt install -y python3-venv` | Required for pyright, ruff |
| ripgrep | `sudo apt install -y ripgrep` | Required for Telescope live_grep |

One-liner for WSL:
```bash
sudo apt update && sudo apt install -y build-essential unzip python3-venv ripgrep
```

## Setup

### WSL

Symlink the config directory:
```bash
ln -sf ~/dev/repos/dev-config/neovim ~/.config/nvim
```

### Windows

Create a symlink (run PowerShell as Administrator, or enable Developer Mode):
```powershell
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dev\repos\dev-config\neovim"
```

### First Launch

Open Neovim. Lazy.nvim will auto-install all plugins on first run.
If telescope-fzf-native fails to build, run `:Lazy build telescope-fzf-native.nvim`.

### Troubleshooting telescope-fzf-native on Windows

If you get an error about `CMAKE_C_COMPILER` not being set:

1. Ensure MinGW is installed: `scoop install mingw`
2. Verify gcc is in PATH: `gcc --version`
3. Verify make is available: `mingw32-make --version`
4. Rebuild the plugin in Neovim: `:Lazy build telescope-fzf-native.nvim`

The build command uses MinGW Makefiles generator to avoid issues with Visual Studio detection.

## Cross-Platform Notes

- **telescope-fzf-native**: Uses `cmake` on Windows, `make` on Linux/WSL (auto-detected)
- **Mason LSP servers**: `pyright` and `ruff` are only installed when Python is available in PATH
- **Line endings**: Enforced as LF via `.gitattributes` at repo root

## Structure

```
neovim/
├── init.lua                  # Entry point
├── lua/
│   ├── config/
│   │   └── lazy.lua          # Plugin manager setup
│   ├── core/
│   │   ├── autocmds.lua      # Auto commands
│   │   ├── commands.lua       # Custom commands
│   │   ├── keymaps.lua        # Key bindings
│   │   └── options.lua        # Editor options
│   ├── plugins/
│   │   ├── core/             # Core plugins (treesitter, plenary, etc.)
│   │   ├── lsp/              # LSP, Mason, completion
│   │   ├── tools/            # Telescope, gitsigns, harpoon, etc.
│   │   └── ui/               # Theme, statusline, bufferline, etc.
│   └── themes/
│       └── aline-sky*.lua    # Custom color scheme
└── lazy-lock.json            # Plugin version lock
```
