set fish_greeting
source ~/BashScripts/aliases.sh
colorscript -r
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
starship init fish | source
