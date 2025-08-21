#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ -o interactive ]] || return

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt autocd
bindkey -e

autoload -Uz vcs_info
precmd() { vcs_info }

# autoload -Uz compinit
# compinit

if [ -f /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# yazi shell wrapper
# change the current working directory when exiting yazi
# y - start yazi
# q - quit with cwd changed
# Q - quit with cwd not changed
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(<"$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Check if fastfetch exists before trying to run it
if command -v fastfetch &>/dev/null; then
    fastfetch
fi

# Check if installed before sourcing
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Check if nvm is installed before sourcing it
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi

# Additional aliases
alias xa='xrandr --auto'
alias a='arandr'

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pundima/.zshrc'

# cuda
export CUDA_HOME="/opt/cuda"
export FORCE_CUDA=0

# nvidea cub - deprecated
export CUB_HOME="/home/pundima/cub-2.1.0"

# gcc
export CC=gcc-14
export CXX=g++-14

# pnpm
export PNPM_HOME="/home/pundima/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# tmux
tks() {
  if [ $# -eq 0 ]; then
    echo "Usage: tkill <session-name1> <session-name2> ..."
    return 1
  fi
  
  for session in "$@"; do
    echo "Killing session: $session"
    tmux kill-session -t "$session"
  done
}
alias tk="tmux kill-server"
alias tls="tmux list-sessions"

# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
alias tm='tmuxifier'
export EDITOR='nvim'
export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/tmuxifier-layouts"

# go
export PATH="$PATH:/usr/local/go/bin"

# prompty
export PATH="$PATH:/home/pundima/dev/prompty" 

# pacman 
pacman() {
    if [[ $1 == "-S" ]]; then
        shift
        sudo command pacman -Syu "$@"
    else
        sudo command pacman "$@"
    fi
}

# dotnet
# dotnet tools
export PATH="$PATH:$HOME/.dotnet/tools"
