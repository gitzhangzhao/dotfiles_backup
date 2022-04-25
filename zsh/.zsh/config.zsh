#######################################################################
#                       personal configurations                       #
#######################################################################

# completions
autoload -U compinit && compinit

# key bindings
bindkey '`' autosuggest-accept

# environment variable
export EDITOR=vim
export PAGER=less
export PATH=$HOME/dotfiles:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/Lab/epics/base-3.15.5/bin/linux-x86_64:$HOME/.vim/plugged/fzf/bin:$PATH
export EPICS_CA_ADDR_LIST=192.168.206.202
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_KEY_SCHEME=vim
export MCFLY_RESULTS=50
export GIT_SSL_NO_VERIFY=true
# export C_INCLUDE_PATH=/usr/src/linux-headers-5.10.0-8-amd64:/usr/src/linux-headers-5.10.0-8-common/include:/usr/src/linux-headers-5.10.0-8-common/arch:/usr/src/linux-headers-5.10.0-8-common/arch/x86/include/asm/

# aliases
alias csn='remmina -c ~/.local/share/remmina/group_vnc_raspi_192-168-206-210-9091.remmina'
alias zz='remmina -c ~/.local/share/remmina/group_rdp_win-张昭_192-168-206-210-9092.remmina'
alias ls='exa --icons -g'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'
alias rm='trash-put'
alias feh='feh --full-screen'
alias bc='eva'
alias bat='bat --theme GitHub'
alias on='synclient Touchpadoff=0'
alias off='synclient Touchpadoff=1'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias du='dust -r'
alias df='duf'
alias diff='difft'
alias al='apt list --upgradable'
alias ap='sudo apt purge'
alias search='sudo apt search -n'
alias pgrep='pgrep -a'
alias cp='cp_with_progress -Rg'
alias mv='mv_with_progress -g'
alias hexdump='hexyl'
alias cv='progress'
alias ip='ip --color'
alias ps='procs --theme dark'
alias reconfigure='sudo dpkg-reconfigure'
alias ag='sudo apt dist-upgrade'
alias aa='sudo apt autopurge'
alias au='sudo apt update'
alias c='command cat ~/Share/pipe.txt | clipcopy > /dev/null'
alias p='clippaste'
alias start='s_mount'
alias stop='s_umount'

# commands
ulimit -c 0 > /dev/null 2>&1

# functions
# 'ls' after every 'cd'
function chpwd_cdls() {
  if [[ -o interactive ]]; then
    emulate -L zsh
    ls
  fi
}

if ! (( $chpwd_functions[(I)chpwd_cdls] )); then
  chpwd_functions+=(chpwd_cdls)
fi

function proxy(){
    export http_proxy=http://localhost:20172
    export https_proxy=https://localhost:20172
    export all_proxy=socks5://localhost:20170
    echo -e "\033[32mHTTP Proxy on\033[0m"
}

function unproxy(){
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo -e "\033[31mHTTP Proxy off\033[0m"
}
