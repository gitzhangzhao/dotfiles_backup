#!/bin/bash

function uninstall_dotfiles() {
sudo stow -D --targe /etc apt
sudo stow -D --targe /etc network
sudo stow -D --targe /etc systemd
sudo stow -D --targe /etc samba
stow -D --target "$HOME" Xresources
stow -D --target "$HOME" bin
stow -D --target "$HOME" compton
stow -D --target "$HOME" cron
stow -D --target "$HOME" dunst
stow -D --target "$HOME" flameshot
stow -D --target "$HOME" fonts
stow -D --target "$HOME" gdb
stow -D --target "$HOME" git
stow -D --target "$HOME" goldendict
stow -D --target "$HOME" i3
stow -D --target "$HOME" mpv
stow -D --target "$HOME" nitrogen
stow -D --target "$HOME" picom
stow -D --target "$HOME" polybar
stow -D --target "$HOME" qterminal
stow -D --target "$HOME" qv2ray
stow -D --target "$HOME" scripts
stow -D --target "$HOME" ssh
stow -D --target "$HOME" vim
stow -D --target "$HOME" wallpaper
stow -D --target "$HOME" zsh
stow -D --target "$HOME" sogoupinyin
stow -D --target "$HOME" zathura
}

uninstall_dotfiles
