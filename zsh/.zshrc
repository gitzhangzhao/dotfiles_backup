#!/bin/zsh

# zplug - manager plugins
source /usr/share/zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sodu", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/last-working-dir", from:oh-my-zsh
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

# aliases
# alias blue='blueman-manager'
# alias send='blueman-sendto'
# alias windows="remmina -c ~/zhangzhao/dotfiles/dotfiles_x64/group_rdp_debian2win10_192-168-137-1.remmina"
alias ls='exa --icons --header'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'
alias rm="trash-put"
alias wicd="wicd-client"
alias feh="feh --full-screen"
alias ps="ps -ef"
alias bc="speedcrunch"
alias on='synclient Touchpadoff=0'
alias off='synclient Touchpadoff=1'
alias k9='kill -9'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias du='ncdu -2'
alias df='duf'
alias cat='batcat --theme 1337'
alias al='apt list --upgradable'
alias ap='sudo apt purge'
alias search='sudo apt search -n'
alias pgrep='pgrep -a'
alias cp='cp_with_progress -Rg'
alias mv='mv_with_progress -g'
alias hexdump='hexyl'
alias cv="progress"
alias ip="ip --color"
alias reconfigure="sudo dpkg-reconfigure"
alias pdf="zathura"
alias ag="sudo apt dist-upgrade"
alias aa="sudo apt autopurge"
alias au="sudo apt update"

# key bindings
bindkey '`' autosuggest-accept

# environment variable
PATH=$HOME/dotfiles:$HOME/.local/bin:$PATH:/home/zhangzhao/Lab/epics/base-3.15.5/bin/linux-x86_64:/usr/lib/cargo/bin
EPICS_CA_ADDR_LIST=192.168.1.8
