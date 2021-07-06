# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -U colors && colors

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/BashScripts/aliases.sh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PATH="$PATH:$HOME/.local/bin/"
colorscript -r
printf '\n'
eval "$(starship init zsh)"

