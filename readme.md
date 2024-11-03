# Dev Environment Configuration

This is my very opinionated dev environment configuration. Proceed at you own risk.

# Ubuntu (Windows WSL)

These are instructions for Ubuntu Linux

## Pre-Requisites

### WSL

> Skip this step if you are not running Ubuntu Linux on Windows WSL

Enable WSL on Windows by executiing:
`Command + R / Optional Features + Enable Windows Subsystem for Linux`

Install Ubuntu 22.04 WSL

```
wsl --install Ubuntu-22.04
```

Make Ubuntu default WSL distribution

```
wsl --set-default Ubuntu-22.04
```

Remove Windows environment variables from Linux `$PATH`, by adding the following line to the `/etc/wsl.conf`:

```
[interop]
appendWindowsPath = false
```

Launch WSL:

```
wsl
```

### Python

Check that python3 is installed

```
python3 --version

```

### NodeJS

```
sudo apt install nodejs
node --version
npm --version

```

### UnZip

```
sudo apt install unzip
```

### FD

```
sudo apt install fdclone
```

### GCC

```
sudo apt install gcc
```

### Make

```
sudo apt install make
```

### FZF

```
sudo apt install fzf
```

### RipGrep

```
sudo apt install ripgrep
```

### Sox

```
sudo apt install sox
sudo apt install libsox-fmt-mp3
```

### NVM

Check for the [most recent version](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating) and update the URL below if needed

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm --version
```

### JDK

Check for the exact version of JDK you need, or install the latest one

```
sudo apt install openjdk-21-jdk-headless
```

### LTeX Language Server

```
wget https://github.com/valentjn/ltex-ls/releases/download/16.0.0/ltex-ls-16.0.0-linux-x64.tar.gz
sudo tar xzvf ltex-ls-16.0.0-linux-x64.tar.gz -C /opt
rm ltex-ls-16.0.0-linux-x64.tar.gz
```

Add `/opt/ltex-ls-16.0.0/bin` to `$PATH` environment variable in `~/.bashrc`

Verify installation:

```
source ~/.bashrc
ltex-ls --version
```

### Rust

```
curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo --version
```

### Lua

```
sudo apt install lua5.1
```

### LuaRocks

```
sudo apt install luarocks
```

### JsRegExp

```
sudo luarocks install jsregexp
```

### Ruby

```
sudo apt install ruby
```

### Go

```
sudo apt install golang-go
```

### Julia

```
sudo snap install julia --classic
```

### PHP

```
sudo apt install php8.3-cli
```

### PIP

```
sudo apt install python3-pip
```

## NeoVim

NeoVim is a hyperextensible Vim-based text editor.

```
sudo snap install nvim --classic
nvim --version
```

### Node Client

```
sudo npm install -g neovim
```

### Python Client

```
sudo apt install python3-pynvim
```

### Copy NeoVim Configuration

```
cp -r nvim ~/.config/
```

### Launch and Check

```
nvim .
```

Type `:checkhealth` in command mode

## Bash

```
bash
vim .bashrc

```

Add content of the `bash/.bashrc` to the `~/.bashrc` file
