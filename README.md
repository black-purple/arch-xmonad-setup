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
    * python-pip
    * python2-pip
    * xclip
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
>sudo pacman -Syyu --needed xsel xclip python-pip python2-pip ttf-ubuntu-font-family scrot curl wget base-devel cmake ninja bison alacritty ranger w3m uberzug neovim fish firefox chromium qutebrowsr doas vlc mpv texlive-most texlive-lang biber xdg-user-dirs git xdotool lsd bat figlet lolcat neofetch cowsay tldr telegram-desktop discord signal-desktop blender inkscape gimp krita atom godot evince rust
>```


To install packages from the aur use the following command:

NOTE!!

If you don't have an aur helper I suggest you use one.


I personally use yay so this is the command I'm using.

>```
>yay eclipse-java-bin gotop jp2a wps-office shell-color-scripts visual-studio-code-bin tty-clock visual-studio-code-insiders-bin pipes-rs github-desktop otf-fontawesome-5-free ttf-open-sauce-sans ttf-mononoki adobe-source-code-pro-fonts nerd-fonts-mononoki devour shell-color-scripts zsh-syntax-highlighting zsh-autosuggestions-git
>```

If you want to install yay use these steps:

>```
>cd /tmp; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si
>```
<br>

## User Dirs

Change the dir names for my user dirs (Desktop, Downloads, Pictures...) to shorter lowercase names (dt, dls, pcs...) for quick access in the terminal.

>```
>nvim ~/.config/user-dirs.dirs
>```

## Xmonad
Follow the steps here from Brian Buccula's [blog](https://brianbuccola.com/how-to-install-xmonad-and-xmobar-via-stack/) to install **Xmonad**, **Xmonad-contrib** and **Xmobar** using the stack method.

I chose this method to give you the choice to compile these packages with the flags you want.
<br>
<hr>

## Shell prompt
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

I had to install this module in order for some plugins to work.

If you face the same issue use this command:

For Python 3

>```
>python3 -m pip install --user --upgrade pynvim
>```

For Python 2

>```
>python3 -m pip install --user --upgrade pynvim
>```
After that open neovim and run this command 
       ```:Pluginstall```
* vim
>```
>rm ~/.vimrc
>cp ~/dotfiles/configs/vimrc ~/.vimrc
>```

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
>flutter config --enable-linux-desktop
>```

Run flutter doctor again to see if you need any other packages to make apps for Linux / Windows / Mac.
<br>
# Special Thanks 

* Derek Taylor
* Brian Buccola
* Khiky Merveilles

