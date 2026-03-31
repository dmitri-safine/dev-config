# ======================================================
# PowerShell Profile — Personal Development Environment
# Color palette: Aline Sky (matches wezterm & starship)
# ======================================================

# Starship prompt
Invoke-Expression (&starship init powershell)

# PSReadLine colors — Aline Sky palette
Set-PSReadLineOption -Colors @{
    Command            = "#6A8CDF"   # twilight blue
    Parameter          = "#C3C7F7"   # soft sky
    Operator           = "#A8E6CF"   # mint glow
    String             = "#F2E9E4"   # warm cream
    Comment            = "#3F3F4A"   # muted gray
    Keyword            = "#DDBDD5"   # lavender blush
    Variable           = "#FFB6C1"   # rose
    Number             = "#A8E6CF"   # mint glow
    Member             = "#C3C7F7"   # soft sky
    Type               = "#88A8FF"   # bright blue
    InlinePrediction   = "#3F3F4A"   # muted gray
    ListPrediction     = "#6A8CDF"   # twilight blue
    Error              = "#FFD6E0"   # rose haze
    Selection          = "#3F3F4A"   # muted gray
}

# PSReadLine options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Emacs
