# ⭐ **README — Starship Prompt (Aline Sky Theme)**

This directory contains my Starship terminal prompt configuration, designed in the _Aline Sky_ theme:
a gentle, calm, minimalistic aesthetic with soft celestial accents.

This setup is **fully bash-oriented**.
No PowerShell, no Windows-specific shells — only clean, elegant Unix-like usage.

---

## ✨ **1. Install Starship (via scoop)**

If you are using Bash on Windows (Git Bash, MSYS2, Ubuntu on WSL, etc.),
you can install Starship using **scoop**:

```bash
scoop install starship
```

---

## ✨ **2. Configure Bash to use Starship**

Add this line to your `~/.bashrc` or `~/.profile`:

```bash
eval "$(starship init bash)"
```

Reload:

```bash
source ~/.bashrc
```

---

## ✨ **3. Copy the Aline Sky theme**

Place `starship.toml` in:

```
~/.config/starship.toml
```

If the directory does not exist:

```bash
mkdir -p ~/.config
```

---

## ✨ **4. Verify installation**

Run:

```bash
starship explain
```

This will show a detailed breakdown of your prompt and confirm that the configuration is recognized.

---

## ✨ **5. Customization**

If you want to tweak colors or modules:

- All prompt segments are configured inside the `starship.toml`
- Every block is independent and can be enabled/disabled at will
- The theme is intentionally minimalistic and calm, matching the development environment aesthetic

---

## ✨ **6. Philosophy**

Starship is part of my development environment:
a place where tools are crafted with intention, clarity, and beauty.

The Aline Sky theme reflects:

- calm focus
- gentle colors
- clarity without noise
- a sense of space and breath in the terminal

This is not just a prompt.
This is the moment of quiet before creation.
