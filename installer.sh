#!/bin/bash

__RAINBOWPALETTE="1"

function __colortext()
{
  echo -e " \e[$__RAINBOWPALETTE;$2m$1\e[0m"
}

 
function echogreen() 
{
  echo -n $(__colortext "$1" "32")
}

function echored() 
{
  echo -n $(__colortext "$1" "31")
}

function echoblue() 
{
  echo -n $(__colortext "$1" "34")
}

function echopurple() 
{
  echo -n $(__colortext "$1" "35")
}

function echoyellow() 
{
  echo -n $(__colortext "$1" "33")
}

function echocyan() 
{
  echo -n $(__colortext "$1" "36")
}

official_repos_pkgs="ttf-ubuntu-font-family scrot curl wget base-devel cmake ninja bison alacritty ranger w3m uberzug neovim fish firefox chromium qutebrowser doas vlc mpv xdg-user-dirs git xdotool lsd bat figlet lolcat neofetch cowsay tldr telegram-desktop discord signal-desktop blender inkscape gimp krita atom godot evince rust"
aur_pkgs="wps-office shell-color-scripts visual-studio-code-bin tty-clock visual-studio-code-insiders-bin pipes-rs github-desktop otf-fontawesome-5-free ttf-open-sauce-sans ttf-mononoki adobe-source-code-pro-fonts nerd-fonts-mononoki devour shell-color-scripts"
all_pkgs="| *OFFICIAL REPOS* |
alacritty
ranger
w3m
uberzug
neovim
fish
firefox
chromium
qutebrowser
scrot
vlc
mpv
xdg-user-dirs
git
yaourt
xdotool
lsd
bat
htop
figlet
lolcat
cowsay
neofetch
tldr
cmake
ninja
bison
base-devel
telegram-desktop
discord
signal-desktop
blender
inkscape
gimp
krita
atom
evince
rust


| *AUR* |
devour
shell-color-scripts
visual-studio-code-insiders-bin
visual-studio-code-bin
wps-office
pipes-rs
github-desktop
otf-fontawesome-5-free
ttf-open-sauce-sans
ttf-mononoki
adobe-source-code-pro-fonts
nerd-fonts-mononoki
tty-clock

| *GITHUB* |
dart/flutter"

printf "\n\n"
echoblue "Installer Script"
printf "\n\n"


echoyellow "1 : Install all the packages"
printf "\n"
echoyellow "2 : Install official repos packages"
printf "\n"
echoyellow "3 : Install AUR packages"
printf "\n"
echoyellow "4 : Print list of packages"
printf "\n\n"
echogreen "[!] Choose action (default = 1): " 


read -n 1 packages
printf "\n"
echogreen "[?] Install an AUR helper (y/n): " 
read -n 1 helper
printf "\n\n"
if [[ "$helper" == "y" || "$helper" == "" ]]; then
    printf "\n\n"
    echoyellow "1 : Install paru" 
    printf "\n"
    echoyellow "2 : Install yaourt"
    printf "\n"
    echogreen "[!] Choose action: " 
    read -n 1 aur_helper
    printf "\n\n\n"
fi

if [[ "$aur_helper" == "1" ]]; then
        sudo pacman -S --needed base-devel git wget yajl
        cd /tmp
        git clone https://aur.archlinux.org/package-query.git
        cd package-query/
        makepkg -si && cd /tmp/
        git clone https://aur.archlinux.org/yaourt.git
        cd yaourt/
        makepkg -si
fi
if [[ "$aur_helper" == "2" ]]; then
        sudo pacman -S --needed base-devel git wget yajl
        cd /tmp
        git clone https://aur.archlinux.org/paru.git
        cd paru/
        makepkg -si
fi
# 
if [[ "$packages" == "1" || "$packages" == "" ]]; then
  if [ "$aur_helper" == "1" ]; then
  sudo pacman -Syyu -needed `echo $official_repos_pkgs`
  paru -Syyu `echo $aur_pkgs`
  fi
  if [ "$aur_helper" == "2" ]; then
  sudo pacman -Syyu -needed `echo $official_repos_pkgs`
  yaourt -Syyu `echo $aur_pkgs`
  fi
fi
if [ "$packages" == "2" ]; then
sudo pacman -Syyu -needed `echo $official_repos_pkgs`
fi
if [[ "$packages" == "3" && "$aur_helper" == "1" ]]; then
paru -Syyu `echo $aur_pkgs`
fi
if [[ "$packages" == "3" && "$aur_helper" == "2" ]]; then
yaourt -Syyu `echo $aur_pkgs`
fi
if [ "$packages" == "4" ]; then
echo $all_pkgs
fi
