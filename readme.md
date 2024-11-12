# Dev Environment Configuration

This is my very opinionated dev environment configuration. Proceed at you own risk.

[[_TOC_]]

# Windows 10/11

These are instructions for Windows 10/11.

## Pre-Requisites

### Scoop

Scoop provides easy way to install apps on Windows from a command line. Sort of like `apt` or `yum` on Linux, or `brew` on Mac.

Run the following commands from a regular (non-admin) PowerShell terminal:

```pwsh

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

It will install Scoop to its default location:

```pwsh
C:\Users\<YOUR USERNAME>\scoop
```

Check the installation:

```pwsh
scoop help
```

### PowerShell Core

This installs `pwsh.exe` which is different from Windows Powershell `powershell.exe` installed by default and it works much better.

```pwsh
scoop install pwsh
```

Now you can launch it with `[CMD] + r / pwsh` or pin it to your taskbar

### Nerd Fonts

Nerd Fonts add special icons to PowerShell and allow it to be used as an IDE.

```
scoop bucket add nerd-fonts
scoop install Cousine-NF-Mono
```

#### Change PowerShell Font Settings

Open PowerShell in admin mode, then click on down arrow next to `+` sign, go to `Settings` -> `PowerShell` -> `Appearance` -> `Text` -> `Font Face` and change it to `Cousine Nerd Font Mono`.

Reopen PowerShell in normal (non-admin) mode and verify that this setting persists.

### Git

```
scoop install git
```

### Python

```
scoop install python
python --version
```

### NodeJS

```
scoop install nodejs
node --version
npm --version

```

### UnZip

```
scoop install unzip
```

### Wget

```
scoop install wget
```

### GZip

```
scoop install gzip
```

### FD

```
scoop install fd
```

### GCC

```
scoop install gcc
```

### Mingw

```
scoop install mingw
```

### Make

```
scoop install make
```

### FZF

```
scoop install fzf
```

### Grep

```
scoop install grep
```

### RipGrep

```
scoop install ripgrep
```

### Ln

```
scoop install ln
```

### Sox

```
scoop install sox
```

### NVM

```
scoop install nvm
```

### JDK

Download specific version of JDK from [https://jdk.java.net/archive/](https://jdk.java.net/archive/). For example, `jdk-21`

Unzip `jdk-21` to `C:\Users\<YOUR USERNAME>\AppData\Local\Programs`

#### Create environment variables

1. Click `Windows + R` and then type `sysdm.cpl` and press `Ok`
2. Go to `Advanced` -> `Environment Variables`
3. Add `C:\Users\<YOUR USERNAME>\AppData\Local\Programs\jdk-21\bin` value to `Path` environment variable in `User Variables`
4. Create new environment variable `JAVA_HOME` with value `C:\Users\<YOUR USERNAME>\AppData\Local\Programs\jdk-21`
5. Verify JDK installation

```
java --version
echo $env:JAVA_HOME
```

### .Net

```
wget https://dot.net/v1/dotnet-install.ps1
./dotnet-install.ps1

```

#### Create environment variables

1. Click `Windows + R` and then type `sysdm.cpl` and press `Ok`
2. Go to `Advanced` -> `Environment Variables`
3. Add `C:\Users\<YOUR USERNAME>\AppData\Local\Microsoft\dotnet` value to `Path` environment variable in `User Variables`
4. Create new environment variable `DOTNET_ROOT` with value `C:\Users\<YOUR USERNAME>\AppData\Local\Microsoft\dotnet`
5. Verify .Net installation

```
dotnet --version
echo $env:DOTNET_ROOT
```

### .Net Debugger

```
scoop install netcoredbg
```

### LTeX Language Server

```
wget https://github.com/valentjn/ltex-ls/releases/download/16.0.0/ltex-ls-16.0.0-windows-x64.zip
unzip .\ltex-ls-16.0.0-windows-x64.zip -d C:\Users\<YOUR USERNAME>\AppData\Local\ltex-ls
```

Add `C:\Users\<YOUR USERNAME>\AppData\Local\ltex-ls\ltex-ls-16.0.0\bin` to `PATH` environment variable.

Verify installation:

```
ltex-ls --version
```

### Rust

```
scoop install rust
cargo --version
```

### Lua for Windows

```
scoop install lua-for-windows
```

### LuaRocks

```
scoop install luarocks
```

### JsRegExp

```
luarocks install jsregexp
```

### Ruby

```
scoop install ruby
```

### Go

```
scoop install go
```

### Julia

```
scoop install julia
```

### PHP

```
scoop install php
```

## NeoVim

NeoVim is a hyperextensible Vim-based text editor.

```
scoop install neovim
nvim --version
```

### Node Client

```
npm install -g neovim
```

### Python Client

```
pip install pynvim
```

### Copy NeoVim Configuration

```
cp -r nvim ~\AppData\Local
```

### Launch and Check

```
nvim .
```

Type `:checkhealth` in command mode

## WezTerm

Install WezTerm from [https://wezfurlong.org/wezterm/installation.html](https://wezfurlong.org/wezterm/installation.html)

Copy `.wezterm.lua` file into the home directory

```
cp wezterm\.wezterm.lua ~
```

## PowerShell

### Install required Modules

```
Install-Module -Name Terminal-Icons
Install-Module -Name PSFzf
```

Copy content of `powershell/Microsoft.PowerShell_profile.ps1` to the file pointed to `$PROFILE` environment variable

```
nvim $PROFILE
```

## Bash

```
bash
vim .bashrc

```

Add content of the `bash/.bashrc` to the `~/.bashrc` file

## Jupynium Plugin

Plugin for working with Jupyter notebooks from NeoVim

1. Install Firefox (only works with Firefox)
2. Install Gecko driver

```
scoop install geckodriver
```

3. Install required Python packages

```
pip install notebook nbclassic jupyter-console
```

Check the [readme](https://github.com/kiyoon/jupynium.nvim) for any additional information
