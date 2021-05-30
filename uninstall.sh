#!/bin/bash

function delete_dotfiles() {
sudo stow --delete --target /  etc
stow --delete --target "$HOME" Xresources
stow --delete --target "$HOME" bin
stow --delete --target "$HOME" compton
stow --delete --target "$HOME" cron
stow --delete --target "$HOME" dunst
stow --delete --target "$HOME" flameshot
stow --delete --target "$HOME" fonts
stow --delete --target "$HOME" gdb
stow --delete --target "$HOME" git
stow --delete --target "$HOME" goldendict
stow --delete --target "$HOME" i3
stow --delete --target "$HOME" mpv
stow --delete --target "$HOME" nitrogen
stow --delete --target "$HOME" picom
stow --delete --target "$HOME" polybar
stow --delete --target "$HOME" qterminal
stow --delete --target "$HOME" qv2ray
stow --delete --target "$HOME" redshift
stow --delete --target "$HOME" scripts
stow --delete --target "$HOME" ssh
stow --delete --target "$HOME" vim
stow --delete --target "$HOME" vscode
stow --delete --target "$HOME" wallpaper
stow --delete --target "$HOME" zsh
}

delete_dotfiles
