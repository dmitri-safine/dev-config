
# Dev Environment Configuration 
This is my very opinionated dev environment configuration. Proceed at you own risk.

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

### Rust

```
scoop install rust
cargo --version
```

### LuaRocks

```
scoop install luarocks
```

### JsRegExp

```
luarocks install jsregexp
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



