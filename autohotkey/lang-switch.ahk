#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
;  Keyboard layout switcher
;  CapsLock        ->  toggle English <-> Russian
;  Ctrl+Shift+P    ->  Portuguese (Brazil)
;  Shift+CapsLock  ->  normal Caps Lock (if ever needed)
;
;  On every switch the current layout (EN/RU/PT) is written to
;  %LOCALAPPDATA%\kb-layout, so terminals/editors can show it in
;  their status line (see wezterm/neovim configs).
; ============================================================
;  Prefer a combo instead of CapsLock? Replace the
;  "CapsLock:: ToggleEnRu()" line with one of:
;     ^Space:: ToggleEnRu()    ; Ctrl+Space
;     !Space:: ToggleEnRu()    ; Alt+Space
; ============================================================

; --- Keyboard layout identifiers (KLID) ---
EN := "00000409"   ; English (US)
RU := "00000419"   ; Russian
PT := "00000416"   ; Portuguese (Brazil). Not switching? Try "00010416" (ABNT2)

; --- Status file shared with terminal/editor indicators ---
LayoutFile := EnvGet("LOCALAPPDATA") . "\kb-layout"
WriteLayout(CurrentLayoutName())   ; initialize at startup

; --- Hotkeys ---
CapsLock::   ToggleEnRu()
^+p::        SetLayout(PT)
+CapsLock::  SetCapsLockState(!GetKeyState("CapsLock", "T"))

; --- Logic ---
ToggleEnRu() {
    global EN, RU
    if (GetCurrentLangId() = 0x0419)   ; currently Russian -> switch to English
        SetLayout(EN)
    else                                ; otherwise -> switch to Russian
        SetLayout(RU)
}

; NOTE: Windows does not reliably refresh the taskbar language indicator when the
; layout is changed programmatically (a known WM_INPUTLANGCHANGEREQUEST quirk).
; Typing is always correct; the layout is surfaced in the terminal/editor status
; line instead via the LayoutFile written below.
SetLayout(klid) {
    hkl := DllCall("LoadKeyboardLayout", "Str", klid, "UInt", 1, "Ptr")
    hwnd := WinExist("A")
    if hwnd
        PostMessage(0x50, 0, hkl, , "ahk_id " hwnd)   ; WM_INPUTLANGCHANGEREQUEST
    WriteLayout(NameForKlid(klid))
}

GetCurrentLangId() {
    hwnd := WinExist("A")
    tid := DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "Ptr", 0, "UInt")
    hkl := DllCall("GetKeyboardLayout", "UInt", tid, "Ptr")
    return hkl & 0xFFFF
}

CurrentLayoutName() {
    return NameForLangId(GetCurrentLangId())
}

NameForKlid(klid) {
    global EN, RU, PT
    if (klid = EN)
        return "EN"
    if (klid = RU)
        return "RU"
    if (klid = PT)
        return "PT"
    return "??"
}

NameForLangId(id) {
    if (id = 0x0409)
        return "EN"
    if (id = 0x0419)
        return "RU"
    if (id = 0x0416)
        return "PT"
    return "??"
}

WriteLayout(name) {
    global LayoutFile
    try FileOpen(LayoutFile, "w").Write(name)
}
