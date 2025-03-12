#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# PATH modification
export PATH="/opt/idea-IU-233.15619.7/bin:$PATH"
export PATH="/home/pundima/eclipse/java-2024-09/eclipse:$PATH"
#export PATH="/opt/idea-IU-242.21829.142/bin:$PATH"
export PATH="/opt/WebStorm-242.21829.149/bin:$PATH"
export PATH="/opt/JetBrains Rider-2024.2.7/bin:$PATH"

# yazi shell wrapper
# change the current working directory when exiting yazi
# y - start yazi
# q - quit with cwd changed
# Q - quit with cwd not changed
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Start fastfetch
fastfetch

# nvm
source /usr/share/nvm/init-nvm.sh

alias xa='xrandr --auto'
alias a='arandr'
