#!/usr/bin/bash

function creat_directory() {
    mkdir -p $(HOME)/.config
    mkdir -p $(HOME)/.local/bin
    mkdir -p $(HOME)/.local/share/fonts
}

function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting"
        exit 1
    fi
}

function deploy_dotfiles() {
sudo stow --no-fold --targe /etc apt
sudo stow --no-fold --targe /etc network
sudo stow --no-fold --targe /etc systemd
sudo stow --no-fold --targe /etc samba
stow --no-fold --target "$HOME" Xresources
stow --no-fold --target "$HOME" bin
stow --no-fold --target "$HOME" compton
stow --no-fold --target "$HOME" cron
stow --no-fold --target "$HOME" dunst
stow --no-fold --target "$HOME" flameshot
stow --no-fold --target "$HOME" fonts
stow --no-fold --target "$HOME" gdb
stow --no-fold --target "$HOME" git
stow --no-fold --target "$HOME" goldendict
stow --no-fold --target "$HOME" i3
stow --no-fold --target "$HOME" mpv
stow --no-fold --target "$HOME" nitrogen
stow --no-fold --target "$HOME" picom
stow --no-fold --target "$HOME" polybar
stow --no-fold --target "$HOME" qterminal
stow --no-fold --target "$HOME" qv2ray
stow --no-fold --target "$HOME" redshift
stow --no-fold --target "$HOME" scripts
stow --no-fold --target "$HOME" ssh
stow --no-fold --target "$HOME" vim
stow --no-fold --target "$HOME" wallpaper
stow --no-fold --target "$HOME" zsh
stow --no-fold --target "$HOME" sogoupinyin
}

check_prog stow
#creat_directory 
deploy_dotfiles
