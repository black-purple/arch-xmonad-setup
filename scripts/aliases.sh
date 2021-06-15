#!/bin/sh

# calling scripts
alias dt=~/BashScripts/mygreetings.sh
alias ks=~/BashScripts/lay_sw.sh
alias kp=~/BashScripts/kp.sh

# one letter commands
alias c='clear && dt'
alias e=exit
alias r=ranger
alias v='devour mpv'
alias d=devour

# mpv commads
alias vs='mpv --no-video'

# config commands
alias xc='nvim ~/.xmonad/xmonad.hs; cp ~/.xmonad/xmonad.hs ~/dotfiles/configs/'
alias ac='nvim ~/.config/alacritty/alacritty.yml; cp ~/.config/alacritty/alacritty.yml ~/dotfiles/configs/'
alias brc='nvim ~/.bashrc'
alias zrc='nvim ~/.zshrc'
alias frc='nvim ~/.config/fish/config.fish'

# pacman commands
alias rem='sudo pacman -R --noconfirm'
alias in='sudo pacman -S --noconfirm'
alias psr='pacman -Ss'
alias up='sudo pacman -Syu'

# aur commands
alias ain='yay -S'
alias aup='yay -Syu'

# replacement commands
alias doas='doas --'
alias cat=bat
alias ls=lsd
alias rm='rm -i'
alias nv=nvim
alias clock='tty-clock -scC 3'
alias gotop='gotop -c nord'

# ls shortcuts
alias la='lsd -lhatr'

# git shortcuts
alias gts='git status'
alias gta='git add'
alias gtaa='git add .'
alias gtb='git branch'
alias gtc='git commit -m'
alias gtp='git push -u origin'
