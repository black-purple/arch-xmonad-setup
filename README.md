NOTE!!

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
* System ressources monitor: htop
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
* PDF reader
    * evince
    * zathura
    * okular
* Tools:
    * xdg-user-dirs
    * git
    * paru
    * yay
    * devour
    * shell-color-scripts
    * doas
    * lsd
    * bat
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
    * atom
    * evince
    * wps-office
    * godot
* Programming Languages
    * dart/flutter
    * rust
    * dotnet 

<br>
There is an installer script that installs all of these without user interaction (Including the packages that are from the AUR)

<br>
<br>
## User Dirs
Change the dir names for my user dirs (Desktop, Downloads, Pictures...)

>```
>nvim ~/.config/user-dirs.dirs
>
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

* alacritty
>```
>rm ~/.config/alacritty/alacritty.yml
>cp ~/dotfiles/configs/alacritty.yml ~/.config/alacritty/alacritty.yml
>```

* fish
>```
>rm -rf ~/.config/fish
>cp -r ~/dotfiles/fish/ ~/.config/
>```

* ranger
>```
>rm -rf ~/.config/ranger
>cp -r ~/dotfiles/ranger/ ~/.config/
>```

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

<hr>
<br>

# Thank you Derek & Brian!!
