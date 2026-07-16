#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
;  Keyboard layout switcher
;  CapsLock        ->  toggle English <-> Russian
;  Ctrl+Shift+P    ->  Portuguese (Brazil)
;  Shift+CapsLock  ->  normal Caps Lock (if ever needed)
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

SetLayout(klid) {
    hkl := DllCall("LoadKeyboardLayout", "Str", klid, "UInt", 1, "Ptr")
    hwnd := WinExist("A")
    if hwnd
        PostMessage(0x50, 0, hkl, , "ahk_id " hwnd)   ; WM_INPUTLANGCHANGEREQUEST
}

GetCurrentLangId() {
    hwnd := WinExist("A")
    tid := DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "Ptr", 0, "UInt")
    hkl := DllCall("GetKeyboardLayout", "UInt", tid, "Ptr")
    return hkl & 0xFFFF
}
