# Zed Configuration

This directory contains configuration and documentation for the Zed editor inside the development environment.

It includes:

- The **Aline Sky** color theme
- Installation process for the *latest Zed nightly* (not the stable version)
- Required system dependencies (VC++ 2022 Runtime)
- Instructions for applying and enabling the theme
- Recommended settings for a unified development experience

---

## 🔧 Installation (Windows, via Scoop — Zed Nightly)

The default Scoop bucket contains the *stable* Zed version.  
To install the **fresh nightly builds**, the `versions` bucket must be added.

### 1. Install VC++ Runtime (required dependency)

```bash
scoop install vcredist2022
````

Without this runtime, Zed nightly will fail to start.

### 2. Add the versions bucket

```bash
scoop bucket add versions
```

### 3. Install the Zed Nightly build

```bash
scoop install versions/zed-nightly
```

This installs an up-to-date nightly release that matches the schema version expected by your `aline-sky.json` theme.

You can confirm the installed version with:

```bash
zed --version
```

---

## 📁 Configuration Locations

Zed stores user data inside:

```
%APPDATA%\Zed\
```

On Windows this is:

```
C:\Users\<user>\AppData\Roaming\Zed\
```

### Themes folder (create if missing):

```
%APPDATA%\Zed\themes\
```

---

## 🎨 Installing the Aline Sky Theme

Copy the provided theme into the correct folder:

```bash
cp aline-sky.json "$APPDATA/Zed/themes/"
```

Zed must be **fully restarted** (all windows closed) to detect new themes.

Then enable the theme:

```
Ctrl+Shift+P → Theme: Select Theme → Aline Sky
```

---

## ⚙️ Recommended Settings

Open:

```
%APPDATA%\Zed\settings.json
```

Insert:

```json
{
  "theme": "Aline Sky",
  "editor.font_family": "Cousine NF",
  "editor.font_size": 15,
  "terminal.integrated.font_family": "Cousine NF"
}
```

This ensures consistent Nerd Font glyph rendering across:

* WezTerm
* Starship
* Zed

---

## ✔️ Summary

Your Zed setup now includes:

* The latest **nightly build** installed via Scoop
* Correct dependency (`vcredist2022`)
* A custom **Aline Sky** theme matching WezTerm and Starship
* Clean configuration folder layout
* Unified visual design for the entire development environment aesthetic

This completes the editor layer of the development environment.
