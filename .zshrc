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


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/dec/.opam/opam-init/init.zsh' ]] || source '/home/dec/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

#compdef localstack

_localstack_completion() {
    local -a completions
    local -a completions_with_descriptions
    local -a response
    (( ! $+commands[localstack] )) && return 1

    response=("${(@f)$(env COMP_WORDS="${words[*]}" COMP_CWORD=$((CURRENT-1)) _LOCALSTACK_COMPLETE=zsh_complete localstack)}")

    for type key descr in ${response}; do
        if [[ "$type" == "plain" ]]; then
            if [[ "$descr" == "_" ]]; then
                completions+=("$key")
            else
                completions_with_descriptions+=("$key":"$descr")
            fi
        elif [[ "$type" == "dir" ]]; then
            _path_files -/
        elif [[ "$type" == "file" ]]; then
            _path_files -f
        fi
    done

    if [ -n "$completions_with_descriptions" ]; then
        _describe -V unsorted completions_with_descriptions -U
    fi

    if [ -n "$completions" ]; then
        compadd -U -V unsorted -a completions
    fi
}

if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
    # autoload from fpath, call function directly
    _localstack_completion "$@"
else
    # eval/source/. command, register function for later
    compdef _localstack_completion localstack
fi
