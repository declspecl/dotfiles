################
### env vars ###
################

export PATH=$PATH:~/go/bin/
export RUST_BACKTRACE=1

###################
### zsh modules ###
###################

autoload -U compinit; compinit

##################
### zsh config ###
##################

setopt ignore_eof

###############
### aliases ###
###############

alias cls="clear"

#################
### functions ###
#################

function fzkill() {
    ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
}

######################
### ohmyzsh config ###
######################

export ZSH="$HOME/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    archlinux
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

PROMPT=' %{$fg[magenta]%}%0*%{$reset_color%} %{$fg[cyan]%}%0~%{$reset_color%} $(git_prompt_info)$ '

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
