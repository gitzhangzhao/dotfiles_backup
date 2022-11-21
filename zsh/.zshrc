# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/zhangzhao/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# ZSH_THEME="powerlevel10k/powerlevel10k"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(zsh-autosuggestions zsh-syntax-highlighting extract vi-mode colored-man-pages sudo copybuffer last-working-dir you-should-use autoupdate rust)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ------------------------------------------------------------------------------
# options

#######################################################################
#                       personal configurations                       #
#######################################################################

# completion
autoload -Uz compinit
compinit -i

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
export http_proxy=http://localhost:20172
export https_proxy=https://localhost:20172
export all_proxy=socks5://localhost:20170
export BAT_THEME=Nord
export HISTSIZE=500000
export SAVEHIST=500000

# aliases
alias csn='remmina -c ~/.local/share/remmina/group_vnc_raspi_192-168-206-210-9091.remmina'
alias zz='remmina -c ~/.local/share/remmina/group_rdp_win-张昭_192-168-206-210-9092.remmina'
alias ls='lsd'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'
alias rm='trash-put'
alias feh='feh --full-screen'
alias bc='eva'
alias bat='bat --italic-text always'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias du='dust -r'
alias df='duf'
alias rg='rg --hidden'
alias diff='difft'
alias al='apt list --upgradable'
alias ap='sudo apt purge'
alias search='sudo apt search -n'
alias cp='cp_with_progress -Rg'
alias mv='mv_with_progress -g'
alias hexdump='hexyl'
alias ip='ip --color'
alias ps='procs'
alias ag='sudo apt dist-upgrade'
alias aa='sudo apt autopurge'
alias au='sudo apt update'
alias c='command cat ~/Share/pipe.txt | clipcopy > /dev/null'
alias p='clippaste'
alias h='history'
alias hr='history|rg'
alias start='s_mount'
alias stop='s_umount'
alias scp='scp -C -p -r'
# alias pgrep='pgrep -a'
# alias reconfigure='sudo dpkg-reconfigure'
# alias on='synclient Touchpadoff=0'
# alias off='synclient Touchpadoff=1'

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

# eval
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh --cmd cd)"
