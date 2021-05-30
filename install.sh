#!/usr/bin/bash

function creat_directory() {
    cd $HOME
    mkdir -p .config
    mkdir -p .local/bin
    mkdir -p .local/share/fonts
}

function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting"
        exit 1
    fi
}

function deploy_dotfiles() {
sudo stow --target /  etc
stow --target "$HOME" Xresources
stow --target "$HOME" bin
stow --target "$HOME" compton
stow --target "$HOME" cron
stow --target "$HOME" dunst
stow --target "$HOME" flameshot
stow --target "$HOME" fonts
stow --target "$HOME" gdb
stow --target "$HOME" git
stow --target "$HOME" goldendict
stow --target "$HOME" i3
stow --target "$HOME" mpv
stow --target "$HOME" nitrogen
stow --target "$HOME" picom
stow --target "$HOME" polybar
stow --target "$HOME" qterminal
stow --target "$HOME" qv2ray
stow --target "$HOME" redshift
stow --target "$HOME" scripts
stow --target "$HOME" ssh
stow --target "$HOME" vim
stow --target "$HOME" vscode
stow --target "$HOME" wallpaper
stow --target "$HOME" zsh
}

check_prog stow
creat_directory 
cd $HOME/dotfiles
deploy_dotfiles
