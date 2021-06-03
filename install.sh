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
sudo stow --no-fold --restow --targe /etc apt
sudo stow --no-fold --restow --targe /etc network
sudo stow --no-fold --restow --targe /etc systemd
sudo stow --no-fold --restow --targe /etc samba
stow --no-fold --restow --target "$HOME" Xresources
stow --no-fold --restow --target "$HOME" bin
stow --no-fold --restow --target "$HOME" compton
stow --no-fold --restow --target "$HOME" cron
stow --no-fold --restow --target "$HOME" dunst
stow --no-fold --restow --target "$HOME" flameshot
stow --no-fold --restow --target "$HOME" fonts
stow --no-fold --restow --target "$HOME" gdb
stow --no-fold --restow --target "$HOME" git
stow --no-fold --restow --target "$HOME" goldendict
stow --no-fold --restow --target "$HOME" i3
stow --no-fold --restow --target "$HOME" mpv
stow --no-fold --restow --target "$HOME" nitrogen
stow --no-fold --restow --target "$HOME" picom
stow --no-fold --restow --target "$HOME" polybar
stow --no-fold --restow --target "$HOME" qterminal
stow --no-fold --restow --target "$HOME" qv2ray
stow --no-fold --restow --target "$HOME" scripts
stow --no-fold --restow --target "$HOME" ssh
stow --no-fold --restow --target "$HOME" vim
stow --no-fold --restow --target "$HOME" wallpaper
stow --no-fold --restow --target "$HOME" zsh
stow --no-fold --restow --target "$HOME" sogoupinyin
stow --no-fold --restow --target "$HOME" zathura
}

check_prog stow
#creat_directory 
deploy_dotfiles
