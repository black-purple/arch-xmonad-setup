[NOTE](NOTE)!!

Many of the config files in this repository are originally from Derek Taylor's Gitlab
Also known as DistroTube

These are the links to his work

[Derek Taylor on gitlab](https://gitlab.com/dwt1/)

[DistroTube channel on youtube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg)

For the xmonad installation guide, I took those steps from Brian Buccola

This is the original [article](https://brianbuccola.com/how-to-install-xmonad-and-xmobar-via-stack/)


I spent so much time looking for answers and trying to make things work in xmonad, so this is a guide to help you get the same outcome I got but whitout getting frustrated!!

Enjoy the last result!!

Preview image
<br>
<img src="ss.png" width="800">
<br>
<br>
<img src="ss2.png" width="800">
<br>

# My **Arch Linux Xmonad** setup

## Setup my environment

Install all my needed and favourites apps

* Terminal: alacritty
* File explorer: ranger
    * Dependencies: w3m, uberzug
* Text editor: neovim
* IDE: visual-studio-code
* Shell: fish
* Browser: 
    * firefox
    * chromium
    * qutebrowser
* Screenshot utility: scrot
* System ressources monitor: 
    * htop
    * gotop
* Fonts:
    * ttf-ubuntu-font-family
    * otf-fontawesome-5-free
    * ttf-open-sauce-sans
    * ttf-mononoki
    * adobe-source-code-pro-fonts
    * nerd-fonts-mononoki
* Video player
    * mpv
    * vlc
* PDF reader: evince
* Tools:
    * xdg-user-dirs
    * git
    * paru
    * yay
    * devour
    * shell-color-scripts
    * conky
    * doas
    * lsd
    * bat
    * jp2a
    * figlet
    * lolcat
    * neofetch
    * cowsay
    * tldr
    * tty-clock
    * pipes-rs
    * cmake
    * ninja
    * bison
    * base-devel
    * zsh-syntax-highlighting
    * zsh-autosuggestions-git
* LaTeX
    * texlive-most
    * texlive-lang
    * biber
* Xmonad utils
    * trayer
    * volumeicon
    * nitrogen
    * compton
    * dmenu
* Apps
    * telegram-desktop
    * discord
    * signal-desktop
    * blender
    * inkscape
    * gimp
    * krita
    * github-desktop
    * code
    * code-insiders
    * eclipse
    * atom
    * wps-office
    * godot
* Programming Languages
    * dart/flutter
    * rust

<br>
To install the above packages follow the steps below

<br>
# Packages & Tools
To install the packages in the official repos use the following command:

>```
>sudo pacman -Syyu --needed ttf-ubuntu-font-family scrot curl wget base-devel cmake ninja bison alacritty ranger w3m uberzug neovim fish firefox chromium qutebrowsr doas vlc mpv texlive-most texlive-lang biber xdg-user-dirs git xdotool lsd bat figlet lolcat neofetch cowsay tldr telegram-desktop discord signal-desktop blender inkscape gimp krita atom godot evince rust
>```


To install the packages in the aur use the following command:

NOTE!!

If you don't have an aur helper I suggest you use one.

If you want to install yay use these steps:

>```
>cd /tmp; git clone aur.archlinux.org/yay.git; cd yay; makepkg -si
>```

I personally use yay so this is the command I'm using.

>```
>yay eclipse-java-bin gotop jp2a wps-office shell-color-scripts visual-studio-code-bin tty-clock visual-studio-code-insiders-bin pipes-rs github-desktop otf-fontawesome-5-free ttf-open-sauce-sans ttf-mononoki adobe-source-code-pro-fonts nerd-fonts-mononoki devour shell-color-scripts zsh-syntax-highlighting zsh-autosuggestions-git

>```
<br>

## User Dirs

Change the dir names for my user dirs (Desktop, Downloads, Pictures...) to shorter lowercase names (dt, dls, pcs...)

>```
>nvim ~/.config/user-dirs.dirs
>```

## Xmonad

<br>
Get stack using the following command
<br>
<br>

>```
>curl -sSL https://get.haskellstack.org/ | sh
>```
Then to install it run 

>```
>stack setup
>```
Then go to your xmonad directory

>```
>cd ~/.xmonad
>```

Now clone the git repositories for xmonad, xmonad-contrib and xmobar

>```
># From inside ~/.xmonad.
>
>git clone "https://github.com/xmonad/xmonad" xmonad-git
>git clone "https://github.com/xmonad/xmonad-contrib" xmonad-contrib-git
>git clone "https://github.com/jaor/xmobar" xmobar-git
>```

Let's turn the xmonad directory into a stack project
>```
># From inside ~/.xmonad.
>
>stack init
>```

Now build and install everything

>```
>stack install
>```

Paste this code into a file called ' **build** '

>```
># ~/.xmonad/build
>#!/bin/sh
>exec stack ghc -- \
>  --make xmonad.hs \
>  -i \
>  -ilib \
>  -fforce-recomp \
>  -main-is main \
>  -v0 \
>  -o "$1"
>```

Make sure it’s executable

>```
>chmod a+x build
>```

Whenever you update your xmonad, xmonad-contrib, or xmobar repositories, just cd **~/.xmonad** and run

>```
>stack install
>```

Configure xmonad with your login manager

>```
>/usr/share/xsessions/xmonad.desktop
>
>[Desktop Entry]
>Encoding=UTF-8
>Type=Application
>Name=Xmonad
>Comment=Lightweight X11 tiled window manager written in Haskell
>Exec=xmonad
>Icon=xmonad
>Terminal=false
>StartupNotify=false
>Categories=Application;
>```

Link ' **~/.local/bin/xmonad** '

>```
>ln -s ~/.local/bin/xmonad /usr/bin
>```
<br>
<hr>
<br>

### Shell prompt
Install [starship prompt](https://starship.rs/) using their script

>```
>sh -c "$(curl -fsSL https://starship.rs/install.sh)"
>```

Add the appropriate line to your shell's config file

* bash
>```
># ~/.bashrc
>
>eval "$(starship init bash)"
>```

* fish
>```
># ~/.config/fish/config.fish
>
>starship init fish | source
>```

* zsh
>```
># ~/.zshrc
>
>eval "$(starship init zsh)"
>```

### Vim Plug

Run the following commad for Vim

>```
>curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
>```

Run the following command for Neovim

>```
>sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
>       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
>```

These commads are taken from the [official repo](https://github.com/junegunn/vim-plug) of vim plug 



### Config Files
Clone the repo to your home directory
Copy the config files each to it's appropriate location

* xmonad
>```
>rm ~/.xmonad/xmonad.hs
>cp ~/dotfiles/configs/xmonad.hs ~/.xmonad/xmonad.hs
>cp -r ~/dotfiles/xpm/ ~/.xmonad
>```

* xmobar
>```
>rm ~/.config/xmobar/xmobarrc
>cp ~/dotfiles/configs/xmobarrc ~/.config/xmobar/xmobarrc
>```

* neovim
>```
>rm ~/.config/nvim/init.vim
>cp ~/dotfiles/configs/init.vim ~/.config/nvim/init.vim
>```

    after that open neovim and run this command 
        :Pluginstall
* vim
>```
>rm ~/.vimrc
>cp ~/dotfiles/configs/vimrc ~/.vimrc
>```

    after that open vim and run this command 
        :Pluginstall
* alacritty
>```
>rm ~/.config/alacritty/alacritty.yml
>cp ~/dotfiles/configs/alacritty.yml ~/.config/alacritty/alacritty.yml
>```

* fish
>```
>rm -rf ~/.config/fish
>cp -r ~/dotfiles/configs/fish/ ~/.config/
>```

* ranger
>```
>rm -rf ~/.config/ranger
>cp -r ~/dotfiles/configs/ranger/ ~/.config/
>```

* conky
>```
>rm -rf ~/.config/conky/
>cp -r ~/dotfiles/configs/conky ~/.config/
>```

## Conky Setup

I took the theming from [devianart](https://www.deviantart.com)
<br>
The creater is Khiky Merveilles
<br>
This is the [post](https://www.deviantart.com/khiky-merveilles/art/Enif-Conky-theme-880596072) on [devianart](https://www.deviantart.com)
<br>
Follow the inscructions there and copy the config files here to have the look in the screenshots

## Flutter Install

 Install flutter by cloning the official repo from github
>```
>git clone https://github.com/flutter/flutter.git
>```

Then add the flutter directory to you PATH

Run this command to see if flutter is working fine
(it might take some time to download some files)

>```
>flutter doctor
>```

You will have some erros if you don't have the Android SDK installed

Ignore android studio errors if you're gonna use VScode

When done you might want to run this command to download some needed packages

>```
>flutter precache
>```


If you want to enable desktop support in Flutter use this command:

>```
># I'm assuming you're using Linux 
># but you can add support for Windows & Mac too
>flutter config --enable-linux-desktop
>```

Run flutter doctor again to see if you need any other packages to make apps for Linux / Windows / Mac.
<br>
# Special Thanks 

* Derek Taylor
* Brian Buccola
* Khiky Merveilles

