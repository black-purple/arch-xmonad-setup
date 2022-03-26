#!/bin/sh

# calling scripts
alias dt=~/arch-xmonad-setup/scripts/mygreetings.sh
alias ks=~/arch-xmonad-setup/scripts/lay_sw.sh
alias kp=~/arch-xmonad-setup/scripts/kp.sh

# mpv commads
alias dv='devour mpv'

# mocp commands
alias mocp='mocp -T darkdot_theme'

# config commands
alias xc='nvim ~/.xmonad/xmonad.hs'
alias ac='nvim ~/.config/alacritty/alacritty.yml'
alias brc='nvim ~/.bashrc'
alias zrc='nvim ~/.zshrc'
alias frc='nvim ~/.config/fish/config.fish'

# pacman commands
alias rem='sudo pacman -R --noconfirm'
alias in='sudo pacman -S --needed --noconfirm'
alias psr='pacman -Ss'
alias up='sudo pacman -Syu'

# aur commands
alias ain='yay -S'
alias aup='yay -Syu'

# replacement commands
alias doas='doas --'
alias ls=lsd
alias rm='rm -i'
alias nv=nvim
alias clock='tty-clock -scC 3'
alias gotop='gotop -c nord'
alias c='clear && dt'
alias e=exit
alias r=ranger
alias d=devour
alias v=vim


# ls shortcuts
alias la='lsd -lhatr'

# git shortcuts
alias gts='git status'
alias gta='git add'
alias gtaa='git add .'
alias gtb='git branch'
alias gtc='git commit -m'
alias gtp='git push -u origin'
alias gcl='git clone'
