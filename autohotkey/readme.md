# AutoHotkey

Windows keyboard utilities.

## lang-switch.ahk

Keeps the frequent English/Russian toggle on a single key and moves the
occasional Portuguese layout out of the cycle, so switching never lands on the
wrong language.

| Hotkey | Action |
| --- | --- |
| `CapsLock` | Toggle English <-> Russian |
| `Ctrl+Shift+P` | Switch to Portuguese (Brazil) |
| `Shift+CapsLock` | Normal Caps Lock |

### Requirements

- [AutoHotkey v2](https://www.autohotkey.com/) (`scoop install autohotkey`)

### Run

Double-click `lang-switch.ahk`, or run it directly:

```powershell
& "$env:USERPROFILE\scoop\apps\autohotkey\current\v2\AutoHotkey.exe" "lang-switch.ahk"
```

### Autostart

Put a shortcut to `lang-switch.ahk` in `shell:startup`.

### Status line indicator

On every switch the current layout (`EN` / `RU` / `PT`) is written to
`%LOCALAPPDATA%\kb-layout`. WezTerm and Neovim read this file and show the active
layout in their status line, so the Windows tray indicator becomes optional.

### Notes

- If Portuguese does not switch, set `PT` to `00010416` (ABNT2) in the script.
- Prefer a combo over CapsLock? See the commented alternatives at the top of the script.
