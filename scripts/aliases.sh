#/bin/bash


alias clock='tty-clock -scC 3'
alias dt=~/BashScripts/mygreetings.sh
alias ks=~/BashScripts/lay_sw.sh

# one letter commands
alias c='clear && dt'
alias e=exit
alias r=ranger
alias v='devour mpv'

# config commands
alias xc='nvim ~/.xmonad/xmonad.hs'
alias ac='nvim ~/.config/alacritty/alacritty.yml'
alias brc='nvim ~/.bashrc'
alias frc='nvim ~/.config/fish/config.fish'

# pacman commands
alias rem='sudo pacman -R --noconfirm'
alias in='sudo pacman -S --noconfirm'
alias psr='pacman -Ss'
alias up='sudo pacman -Syu'

# aur commands
alias ain='paru -S'
alias aup='paru -Syu'

# replacement commands
alias doas='doas --'
alias cat=bat
alias ls=lsd
alias rm='rm -i'
alias nv=nvim

