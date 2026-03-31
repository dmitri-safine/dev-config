# WezTerm Configuration

This directory contains the WezTerm configuration used in the development environment.

The configuration includes:

- Aline Sky theme
- Clean Bash-only setup (no PowerShell)
- Integration with Starship
- Windows-friendly installation via Scoop (freshest release)

---

## 🔧 Installation (Windows, via Scoop — latest 2025 build)

> ⚠️ Note: The default `extras` bucket ships **old 2024 builds** of WezTerm.  
> To install the latest version (2025), you must add the `versions` or custom bucket.

### 1. Add the required Scoop bucket

```bash
scoop bucket add versions
````

### 2. Install the latest WezTerm

```bash
scoop install versions/wezterm-nightly
```

This gives you the newest upstream build (matching the versions you verified inside your environment, e.g., 20251111-071056-118802c2).

You can confirm with:

```bash
wezterm --version
```

---

## 📁 Configuration Location

WezTerm loads its config from:

```
%USERPROFILE%\.wezterm.lua
```

To apply the configuration from this repository:

```bash
cp wezterm.lua $HOME/.wezterm.lua
```

---

## 🐚 Shell Configuration

This setup forces WezTerm to run **Bash only**, using Scoop’s shim:

```
C:\Users\<user>\scoop\shims\bash.exe
```

This ensures a consistent POSIX-like environment with:

* no PowerShell
* no CMD
* no Git Bash overrides

---

## 🎨 Aline Sky Theme

This repository includes the Aline Sky terminal theme:

* twilight background (`#1E1F29`)
* lavender foreground (`#E5D9F2`)
* mint cursor (`#A8E6CF`)
* unified palette matching Zed & Starship

The theme is embedded directly into the `.wezterm.lua` file.

---

## 🔁 Applying Changes

To apply updated configuration:

1. Close all WezTerm windows
2. Start WezTerm again via:

```bash
wezterm-gui.exe
```

---

## ✔️ Summary

This WezTerm configuration provides:

* a clean Bash-only terminal
* a modern and consistently updated WezTerm build
* the Aline Sky theme
* a unified look across your entire development environment
